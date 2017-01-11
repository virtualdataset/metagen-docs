# Why Virtual Data?

If it is not real data, then what is the value of it? Virtual 
data is something that, when you need it, has no substitute. 

To explain why, let us consider the trade-offs in some basic
simulation and testing challenges and what they mean.

### Challenge: access large amounts of bulk data

Actual Data
- depends primarily on speed and efficiency of storage system
- limited to size of storage system

Virtual Data
- depends on speed of generation functions and CPU
- not effectively limited to size of storage

In this case, virtual data is strongly favored for testing
 systems that need to be faster than the things that they 
 are targeting. This is an essential requirement for any 
 system that must provide high-fidelity results in timing,
 loading levels, etc. Essentially, load testing is a primary 
 reason for having procedurally generated data. You can
 not easily get high fidelity results if the testing
 apparatus is saturated with load as easily as the test target.

### Challenge: modify basic properties of test data

Actual Data
- requires recapture of test data, regardless of origin

Virtual Data
- has no moving mass, instantly changes according to recipe

The ability to change your data set instantly is also a boon for testing 
systems. Not only can you modify the conditions of a test by changing out 
your virtual data set, you can create multiple variations that can elicit 
interesting contrasts and outcomes, ad-infinitum. The size of a virtual 
data set is paltry, often smaller than testing logic.

### Challenge: create nuanced interplay between data

Actual Data
- same design burden as virtual data, but still with moving mass
- significant effort is spent on managing bulk of data

Virtual Data
- is able to create statistically shaped data without bulk transfer
- is able to provide determinism in addition to statistical shaping
- is able to simulate superset/subset relationships

Because virtual data is dependent on the generation methods, and
generation methods can be chosen themselves to have interesting
mathematical relationships, many things are possible that we don't
even consider when raw data is handed to us.

### Challenge: access real data

Real data wins this one, obviously. Virtual data is *not* strictly real
 data, but it *can* be. Read further for why. 

### Challenge: access realistic data

Virtual data can be as realistic as you need it to be, up to and including
 being based on samples of real data. If you want to capture a real data set 
 and access it as such through a virtual interface, then the data is, in fact, 
 real data.

Virtual data methods can be used as a sliding scale between accessing real data
 and just making it all up according to statistical recipes. With a small 
 amount of real data, you can create a very high volume of simulated data. The small 
 sample is almost always easy to fit in memory, keeping the data generators fast.
 Still, the data generated can be extrapolated to data set sizes that can be
 useful for testing even the largest systems.

For accessing realistic data, **why not both?** If you have an example data 
set, nothing prevents you from using it as raw data through the virtual data
interface. Doing so gives you useful choices for tackling some of the 
challenges above.

### Challenge: partition a dataset for distributed testing

Real Data
- Requires a bulk processing step to do any reconfiguration or (re)partitioning

Virtual Data
- Subset groupings of virtual data are easily described by common recipes.

When you need to be able to identify or control, or vary how data is distributed in
a testing scenario, there is no comparison. 

### Challenge: canonically identify detailed test data parameters

Real Data
- In order to canonically capture and represent the testing parameters with a
  real bulk dataset, you have to have and retain the whole dataset.

Virtual Data
- Virtual data can be described concisely and completely in a recipe. Whether
  you are needing *book end* scenarios that identify corner cases, or more
  *normal* data, the recipes are compact. For data that is based on real
  samples, you get to pick how much is too much.
   
### In Summary

It is possible to have realistic samples, statistical shaping, high throughput, 
immediately adaptivity, and repeatability at the same time.

The examples above are only the tip of the iceberg in terms of what is possible.
Virtual DataSet aims to make it easier to explore and use new dataset simulation
methods.


