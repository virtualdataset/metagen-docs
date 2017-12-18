---
date: 2017-12-16
title: FGK Implementation Ideas
weight: 1000
---

## Computed State and Function Unrolling

For the above example, here are a specific and finite set of uncomputed
states that are possible when the user attempts to observe thee *first_name* field.
They are:

1. <s>cycle and identity have both been changed</s>
2. cycle has been changed
3. user_id has been changed
4. neither cycle nor user_id have been changed

Of these, there are only three distict and actionable execution plans, owing to the
fact that when cycle has been chaged, identity might as well have been changed in terms
of how it affects the value of the *first_name* field. The last case with no changes *is*
a specific execution plan, although it is effectively a NOOP.

This provides a basic rationale for setting the required entry point for
evaluation of the *first_name* field:

- In case **2**, compute the new value of *user_id* from cycle, then compute the new value of *first_name* from *user_id*, then return the value of *first_name*.
- In case **3**, compute the new value of *first_name* and then return the value of the curret *first_name* field.
- In case **4**, do nothing, return the current value of the *first_name* field.

This yields an interesting affinity to loop unrolling, and can be encoded in a kernel with the following pseudocode (with more optimal numbering):

    switch predecessor_state:
      case: 0: compute user_id
      case: 1: compute first_name
    
    return first_name

