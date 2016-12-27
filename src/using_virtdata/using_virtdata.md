# VirtData Usage

# TBD: restructure the section

### Data Mapper Library

Data Mapping functions are packaged into libraries which can be loaded
by the user library module of the project. Each library has its own
way of providing 

### Function Resolver

Each library must implement its own function resolver. This is because each library may have a different way of naming, finding, creating or managing function generator instances. For the user, the description of a generator is simply a string. What the generator library does with it is implementation-specific. This means that some generator libraries may simply have constructor signatures as function specifiers, and others may go as far as implementing their own DSL. The basic contract for a function resolver is that you pass it a string describing what you want, and it provides a generator function in return.

#### Bindings Template

It is often useful to have a template that describes a set of generator functions that can be reused across many threads or other application scopes. A bindings template is a way to capture the requested generator functions for re-use, with actual scope instantiation of the generator functions controlled by the usage point. For example, in a JEE app, you may have a bindings template in the application scope, and a set of actual bindings within each request (thread scope).

