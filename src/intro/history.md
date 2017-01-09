# VirtualDataSet Origin Story

VirtualDataSet began as an experiment to see if a DSL could be used
to create interesting and reusable recipe-driven data streams.

The first generation of the experiment, named **Metagener**, was
generally successful in producing a working prototype, with a direct
generator specification language, fluent API and built-in examples. 
However, it had at least one major failing: It was still
not easy to use.

The current version of the toolkit exists as a reboot of the original
ideas, but with a less ambitious set of goals and a focus providing
something useful. 

The design priorities of this phase of the virtual dataset tools are:

1. Late-binding and easy integration for runtime library extensions
2. Idiomatic Java-8 functional reflection
3. Efficient lambda construction and composition of higher-order data mappers
4. Consumer-friendly APIs for easy client integration
5. A set of common recipe examples for users top copy and paste
6. Useful documentation

Once these basic goals are met, some of the more interesting features of the original project may be added in.

