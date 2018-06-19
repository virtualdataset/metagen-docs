cat<<"EOF" > docsrc/content/functions/autodoc_reference.md
---
date: 2018-06-18
title: All Functions
weight: 74
menu:
  main:
    parent: Function Reference
    identifier: reference
    weight: 51
---
EOF

../virtdata-java/bin/virtdata gendocs | grep -v '\[main\]' >> docsrc/content/functions/autodoc_reference.md
