--------------------
Design
--------------------

Basic requirements
------------------

The Cinode project comes with brand new approach for distributed storage and
application deployment. It totally breaks the concept of centralised services
widely used today. Instead of thinking in terms servers and machines we try to
think here as if the whole Cinode was one hudge cluster of computers scaling
horizontally with every new node plugged in to the network. Simillar concept
change has been done with torrent network where centralised tracker servers
were replaced by fully decentralised DHT network.

In order to create decentralised network consisting of user nodes, each one
of them must share the same low-level logic. Combining them together makes the
network really powerfull - similarly to how simple neurons create complex
brain structure. This logic must be simple, well defined and predictible in
order to have desired functionality of the network. 


In Cinode each node must realise following functinalities:

#. storage
#. data validation
#. blob indexing (DHT)

The storage
------------
All information storex inside cinode is put into data blobs.
They are kept inside network nodes. One particular blob
may be stored in one or more nodes. The more nodes, the better
protection against data loss and quicker download from multiple
nodes simultanously.
Data blob may be copied from one node to another upon a blob requested
Although the first version doesn't asume any authorisation mechanism here,
it's possible thst future versions will introduce one.
The crucial part of each blob's data is always encrypted with a key
that can not be restored from the blob's content itself so even
though the blob can be requested, it's content remains 
protected. The unencrypted part of information is
also stored along the blob to allow static validation
that does not need the access to unencrypted data.

The major requirement for each raw blob data
is that any node must be able to validate it's
content even thouh the access to the unencrypted
part is not granted to that node. Ensuring
this property is valid, nodes can copy blobs
between themselves and still not allow unauthorised
changes to the data. The validation may be as simple
as calculation of a hash value of a blob or may
require validation of a cryptographics data sign.

This validation is an equivalent of te authorisation
to change the data in a standard server-based approach.
The knowledge of blob's data encryption key on the other
hand is an equivalent of the authorisation to read
the data.

Since each node may need to read a particular blob,
we nwwd to be able to name them uniquely. Additionally
there must be a way to quickly find a set of nodes
currently storing given blob. The technology
that fits here well is a DHT network. It has already
prooven to be working correctly in eDonkey-based
networks (Kadmeila) and in trackerless torrent networks.

In order tp fit well into DHT requirements, each blob
will be named using 512-bit (64-byte) identifiers.
One may argue it's way to much for such network.
But he cinode must be protected well to serve the
data for unspecified amount of time. We're slowly
entering the Internet of things era where even
bulbs are network-enabled. The amount of information
grows expotentially so it's better to be prepared.

The blob name must not be a random value. It must
be tightly connected with a blob content so that
it's nesrly impossible to accidentially or
purposefully create a blob that would have
given name. The order must be the opposite.
The content of a blob must be used in
order to create blob's name since the name
takes a part in the blob validation process.

Allowing random blob names would allow
attacks on the network since one could create
a blob with fake data and try to push it in
place of existing valid data. Since the blob
name is a cryptographically created value,
it' nearly impossible to perform such attack.

Additionally to item names, the DHT network
requires each client to have a unique id
of the same byte length as the item names.
In a usual scenario, such id is generated randomly.
In cinode we strenghtrn this requirement. The id
must not be a random value since it would let
one to choose the id of the other one. Instead
we require each peer to have it's private key. The id
of the peer is a 512-bit fingerprint of the mathing
public key. Even if the peer would like to fake
a particular id, other nodes will quickly reject it
due to the lack of a valid private key an thus
the inability to prove itself a valid node.

Blob graph
----------

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

Indexing through the DHT network
---------------------------------------

Since blobs doesn't have any arbitrary location,
it's required to be able to quickly search for
a blob of particular name.
The perfect match here is a DHT network simillar
to those used in Kadmeila or trackerless torrent.
There are following requirements to make this
kind of network work efficiently:

- Each client must have an unique id, ids should
  be distributted regularly across whole range
  of ids available in the network
- Each content searched for must be addressed by
  an unique id, those hashes must be distributted
  refularly across whole range of hash values

For the item identification we can simply use the
id of a blob. Since it's hash-based, it should
provide meet all requirements.

For id of a node we use a fingerprint of node's
public key. Since the fingerpring is also generated
using hash function, it should also distribute
values correctly. This selection of id is a bit
different from those used in i.e. torrent networks
where the id is generated as a strongly random
number of arbitrary length. The problem with such
solition is that one can easily impersonate another
node and thus start doing amlicious activity as if
it was done by the original node.

Here we connect the id of a client with it's
public/private key pair. Since all communication
will happen over SSL/TLS connections, we can use
the peer id to validate the certificate presented
by the peer node presented during SSL handshake
process.
