name: Bug report
description: File a bug report if you notice something wrong in the metadata for any of the samples
body:
  - type: textarea
    id: description
    attributes:
      label: Bug description
      description: Describe the identified problem here alongside which table and sample the issue is in. Provide URLs to citations showing the issue if necessary.
    validations:
      required: true
 - type: textarea
   id: additional_context
    attributes:
      label: Additional context
      description: Provide any other additional information that maybe necessary (e.g. link to slack chat)
