#cat<<"EOF" > docsrc/content/functions/autodoc_reference.md
#---
#date: 2018-06-18
#title: All Functions
#weight: 74
#menu:
#  main:
#    parent: Function Reference
#    identifier: reference
#    weight: 51
#---
#
#Reference Format
#
#Each heading in this page is the name of a function. The description of
#the function in general is provided, if any after it.
#
#The details that follow show all of the forms of the function which are available,
#according to different input, out, and argument signatures. For each form,
#examples and notes are provided if available under *ex:* and *notes:*.
#
#Here is a fake documentation entry that visually explains the layout:
#
#**AnyFunc (not a real function)**
#
#The explanation of what AnyFunc does goes here. It will explain the general purpose of AnyFunc,
#regardless of the type-specific details that may go below.
#
#- int -> AnyFunc(int: size) -> int *(This is the full type signature of one of the availabler versions of AnyFunc)*
#  - *ex:* `AnyFunc(42)` - *An example to the left, and an explanation for what makes it useful.*
#  - *notes:* This particular explanation is just to show where additional notes on the AnyFunc(int) variant would go.
#- long -> AnyFunc(long: size) -> long *(There is another form available which specializes for the long type.)*
#  - *ex:* `AnyFunc(42L)` - *This form wants the argument to be a long*
#
#EOF
#

../virtdata-java/bin/virtdata gendocs
# | grep -v '\[main\]' >> docsrc/content/functions/autodoc_reference.md

for ref in funcref_*.md
do

 category=$(grep '# CATEGORY ' $ref |cut -d' ' -f3)
 cat <<EOF2 > docsrc/content/functions/$ref
---
date: 2018-06-18
title: $category
weight: 75
menu:
  main:
    parent: Function Reference
    identifier: reference-$category
    weight: 52
---
EOF2
grep -v '# CATEGORY' $ref >> docsrc/content/functions/$ref
 
done

