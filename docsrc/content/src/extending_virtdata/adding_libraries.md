# Adding a Data Mapper Library

The basic recipe for adding a data mapper library to the VirtData runtime is a follows:

1. Add maven dependency
2. Implement DataMapperLibrary
   - If you are just wanting to provide functional classes implementing your mapping functions, simply extend ...
3. Implement your functions...
4. Add supporting documentation
5. Add your Maven mojo to publish
   your library to the services manifest in META-INF/services/
6. Expose your library to the runtimes
   
In detail...

### 1. Add a Maven Dependency

### 2. Implement DataMapperLibrary

##### 2.1 ... as a Functional POJO library

### 3. Implement Data Mapper Functions

### 4. Add Documentation

### 5. Publish via ServiceLoader

### 6. Bundle or Side-Load your Artifact

