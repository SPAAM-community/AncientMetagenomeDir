### Loading

## Load and standardise date across tables
load_thedir_data <- function(path, name) {
  read_tsv(path, col_types = cols()) %>%
    mutate(List = name) %>%
    select(List, everything())
}

### Publication Timeline

stats_pub_timeline <- function(...) {
  x <- list(...)
  
  ## Get only relevent columns
  lapply(x, FUN = function(y) {
    select(
      y,
      List, publication_doi,
      publication_year
    ) %>% distinct()
  }) %>%
    bind_rows() %>%
    mutate(List = factor(List, levels = names(dir_colours)))
}

plot_pub_timeline <- function(dat) {
  ## Get range so we plot x-axis nicely
  spanning_years <- dat %>% summarise(min = min(publication_year), max = max(publication_year))
  
  ggplot(dat, aes(publication_year, fill = List)) +
    scale_fill_manual(values = dir_colours, guide = guide_legend(ncol = 1)) +
    scale_y_continuous(labels = scales::number_format(accuracy = 1)) +
    geom_bar(bins = spanning_years$max - spanning_years$min, binwidth = 1) +
    scale_x_continuous(breaks = seq(spanning_years$min, spanning_years$max, 2)) +
    theme_classic() +
    theme(legend.position = "none") +
    facet_wrap(~List, ncol = 1) +
    labs(title = "Publications per year", 
        subtitle = paste("Updated:", Sys.Date()),
        x = "Publication year",
        y = "Number of publications",
        fill = NULL,
        caption =  expression(paste(bold("License: "), "CC-BY 4.0. ", bold("Source: "), "AncientMetagenomeDir")))
}

### Cumulative Samples Timeline

stats_cumulative_timeline <- function(...) {
  ## Takes a list of AncientMetagenomeDir TSVs
  x <- list(...)
  
  ## Get only relevent columns
  dat <- lapply(x, FUN = function(y) {
    select(
      y,
      List, sample_name, publication_year,
      publication_year
    ) %>% distinct()
  }) %>%
    bind_rows() %>%
    mutate(List = factor(List, levels = names(dir_colours)))
  
  spanning_years <- dat %>%
    ungroup() %>%
    summarise(min = min(publication_year), max = max(publication_year))
  
  ## Make fake base table to ensure all years for all lists
  ## Currently manually defined
  base_table <- list(
    seq(spanning_years$min, spanning_years$max, 1),
    seq(spanning_years$min, spanning_years$max, 1),
    seq(spanning_years$min, spanning_years$max, 1)
  )
  
  names(base_table) <- levels(dat$List)
  
  base_table <- base_table %>%
    enframe(name = "List", value = "publication_year") %>%
    unnest(publication_year)
  
  dat <- dat %>%
    group_by(List, publication_year) %>%
    summarise(count = n())
  
  dat %>%
    right_join(base_table, by = c("List", "publication_year")) %>%
    replace_na(list(count = 0)) %>%
    arrange(List, publication_year) %>%
    mutate(List = factor(List, levels = names(dir_colours))) %>%
    group_by(List) %>%
    mutate(cumulative_sum = cumsum(count))
}

plot_cumulative_timeline <- function(x) {
  
  spanning_years <- list(min_year = min(x$publication_year), max_year = max(x$publication_year))
  
  ## Get range so we plot x-axis nicely
  ggplot(x, aes(publication_year, cumulative_sum, fill = List)) +
    geom_bar(stat = "identity") +
    scale_y_continuous(labels = scales::number_format(accuracy = 1)) +
    scale_x_continuous(breaks = seq(spanning_years$min_year, spanning_years$max_year, 2)) +
    theme_classic() +
    scale_fill_manual(values = dir_colours, guide = guide_legend(ncol = 1)) +
    theme(legend.position = "none") +
    facet_wrap(~List, ncol = 1) +
    labs(title = "Cumulative published samples per year", 
         subtitle = paste("Updated:", Sys.Date()),
            x = "Publication year",
            y = "Number of samples (cumulative sum)",
          caption =  expression(paste(bold("License: "), "CC-BY 4.0. ", bold("Source: "), "AncientMetagenomeDir"))) +
    labs(fill = NULL)
  
}

### Map

stats_map <- function(...){
  
  x <- list(raw_environmental, raw_hostmetagenome, raw_hostsinglegenome)
  
  dat <- lapply(x, FUN = function(y) {
    select(
      y,
      List, sample_name, geo_loc_name, latitude, longitude,
      publication_year
    ) %>% distinct()
  }) %>%
    bind_rows() %>%
    mutate(List = factor(List, levels = names(dir_colours)))
  
  dat <- dat %>%
    group_by(List, geo_loc_name, latitude, longitude) %>%
    summarise(count = n()) %>%
    mutate(List = factor(List, levels = names(dir_colours)))
}

plot_map <- function(dat){
  
  world_map <- map_data("world")
  
  ggplot() +
    geom_polygon(data = world_map, aes(x = long, y = lat, group = group), fill = "white", colour = "grey", size = 0.3) +
    geom_point(data = dat, aes(x = longitude, y = latitude, fill = List, size = count), shape = 21, alpha = 0.5) +
    theme_linedraw() +
    facet_wrap(~List, ncol = 1) +
    theme_classic() +
    scale_fill_manual(values = dir_colours) +
    theme(legend.position = "none") +
    labs(title = "Geographic locations of samples", 
        subtitle = paste("Updated:", Sys.Date()),
        x = "Longitude",
        y = "Latitude",
        fill = "Sample Type", 
        size = "Sample Count",
        caption =  expression(paste(bold("License: "), "CC-BY 4.0. ", bold("Source: "), "AncientMetagenomeDir"))) +
    guides(fill = FALSE)
  
}

### Age Timeline

stats_age_timeline <- function(...){
  x <- list(...)
  
  dat <- lapply(x, FUN = function(y) {
    select(
      y,
      List, sample_name, geo_loc_name, latitude, longitude, sample_age, publication_year
    ) %>%
      distinct()
  }) %>%
    bind_rows() %>%
    mutate(List = factor(List, levels = names(dir_colours)))
  
  return(dat)
}

# from https://stackoverflow.com/a/11054781
reverselog_trans <- function(base = exp(1)) {
  trans <- function(x) -log(x, base)
  inv <- function(x) base^(-x)
  trans_new(paste0("reverselog-", format(base)), trans, inv,
            log_breaks(base = base),
            domain = c(1e-100, Inf)
  )
}

# Plot histograms, with custom binning!
plot_figure_age_timeline <- function(X, dataset, nclass = "Sturges", log = TRUE, group_order){
  
  X <- X %>% filter(List == dataset) %>% ungroup()
  
  # We steal the breaks from the base histogram
  if (log){
    hist_data <- hist(log10(X$sample_age), plot = FALSE, breaks = nclass)
    scale_log = scale_x_reverse(breaks = c(2,3,4,5), labels = comma(c(10^2, 10^3, 10^4, 10^5)), limits = c(5, 2))
  } else {
    hist_data <- hist(X$sample_age, plot = FALSE, breaks = nclass)
    scale_log = scale_x_reverse()
  }
  
  # We calculate where we want to have the columns in the plot
  width <- mean(diff(hist_data$breaks))
  nudge <- -(width/2)
  hist_df <- tibble(counts = hist_data$counts, breaks = (hist_data$breaks[1:length(hist_data$breaks)-1]), List = dataset) %>%
    mutate(width = width, nudge = nudge, 
           List = factor(List, levels = group_order))
  
  # Let's plot
  plot <- ggplot(hist_df, aes(breaks, counts, fill = List)) +
    geom_col(color = "black", width = width, position = position_nudge(x = nudge)) +
    #scale_y_log10() +
    scale_log +
    theme_classic(base_size = 8) +
    scale_fill_manual(values = dir_colours, guide = guide_legend(ncol = 1, reverse = T)) +
    labs(x = "Samples (n)",
         y = "Years before present",
         title = "Age distribution of samples", 
         subtitle = paste("Updated:", Sys.Date()),
         caption =  expression(paste(bold("License: CC-BY 4.0. ", bold("Source: "), "AncientMetagenomeDir")))) +
    theme(legend.position = "none",
          strip.background = element_blank())
    
    return(list(plot = plot, data = hist_df))
}
