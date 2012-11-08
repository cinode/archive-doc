Blob graph
-------------

Each blob may either contsin some information
with it or link to other blobs in the network.
This is simillar to standard filesystem in
almost any cufrent operating system - the
information is stored inside files, references
are stored in directories and symbolic links.
In cinode we use static blobs for data storage
(file equivalent) and directory storage
(directory equivalent). We also use dynamic
blob links (symbolic links equivalent).
Future cinode versions may also provide
more dedicated structires like a
dynamic queue (simillar to directori with
additional constraints) or real-time
communication channels (simillar to
unix pipes or device files).

There's one hudge difference between traditional
filesystem and cinode's blob structure. A standard
fs always contain a concept of the root directory
being an entrance point to all other files and
directories in the fs. In cinode the blob namespace
is rootless. But in order to be able to traverse
the blob graph, each user has his private user's
root dynamic blob link pointing to a static directory
(the dynamic link is necessary to have one unchanging
name the user can reffer to). Starting from it,
we can traverse whole graph of blobs that can be
read and potentially modified by the user. Additionaly
vevery application in cinode doing some operations
on user data should have it's own root link/dir
so that it can't access or break the data outsude
this "jail".

Although due to this kind of protection we create
a good concept of data access, it's still potentially
dangerous  to use without a care since one invalid
dynamic link may give access to hudge amount of blobs.
The software of a node is thus responsible for
additional "sanity" checks so that the user can
not share his root without a proper warning for example.
Future versions of cinode may also introduce additional
security models introducing extra barriers that can not
be crosed without explicitely granted permission.

The overall structure of blobs in cinode is in
fact a directed cyclic graph where blobs and directories
are graph nodes, dire tory entries and links are
graph edges. A cycle, althouh not allowed in static
structure (due to a need of reversing a hashing
function), can be introduced using dynamic links
or queues. This need to be considered when creating
algorithms traversing the graph. Even if the
data structure was initially created by a valid
creator thst doesn't introduce cycles, the data
that's put into given algorithm on it's input
is not guaranteed to be  reated by a valid
generator.


