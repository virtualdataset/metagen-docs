# VirtData Library Structure

The data mapping functions that come with the virtdata runtime
are implemented and packaged as individual libraries. They come
along for the ride with the runtime artifact.

### Data Mapper Libraries

Each such library is known as a *data mapper library*, and comes
with its own essential machinery:

##### Library Metadata
The metadata for a library describes the name and purpose of the
  library so that users may know when and why to use it.
  
##### The Resolver Implementation
 
Each data mapper library must be responsible for locating data 
mapping functions based on a request from the user. Each library
may use its own unique data mapping methods, thus each library must be 
responsible for the lookup mechanism for them.

##### Data Mapper Implementations

Whether in POJO form or something more fanciful like byte code 
generation, each library exists to provide a uniquely useful
way of mapping inputs to data.

##### Data Mapper Documentation

Documentation for the data mapping functions is an essential and
required component of a data mapper library. When documentation
is provided via the standard API, users can be given a whole-system
view of the available functions and libraries in their runtime.

##### Seed Data

Data files that may be used by library functions in order to
provide realistic texture to generated datasets.

### 

An actual data mapping function can be a simple POJO or
other concrete type, but this is up to the implementing library.
In other words, a library is free to create any type of
implementation internally that can be passed to the user
runtime via one of the common functional interfaces. This
leaves room for implementors to use byte code generation
or any other techniques that are appropriate for their needs.

### Runtime Discovery / Late Binding

Each library is expected to implement the core DataMapperLibrary
interface, but also to publish itself in the META-INF/services
directory in the published jar. Every library is loaded via this
discovery mechanism including the core libraries. See
[Adding Libraries](extending_virtdata/adding_libraries.html) for
detailed instructions on this.



