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


