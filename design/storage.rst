------------
The storage
------------

All information stored inside Cinode network is kept inside data blobs.
One particular blob may be stored in one or more nodes. The more nodes,
the better protection against data loss and possibility for quicker
download from multiple nodes simultanously.

Data blob may be copied from one node to another upon a blob requested.
Although the first version doesn't asume any authorisation mechanism here,
it's possible that future versions will add it. To keep blobs safe, each
one is encrypted with a symmetric key not distributed with the blob.
Getting the correct blob's key is equal to gaining read access to it.

The major requirement for each raw blob data is that any node must be able
to validate it's content even without blob's encryption key. Validating
blobs while copying them between nodes will prevent unauthorised data
manipulation. The validation method depends on the blob type and may be
as simple as hash calculation or more comples like validation of a digital
sign.

The blob validation is an equivalent of the write authorisation used
in a standard server-based approach. On the other hand, the knowledge of
blob's data encryption key is an equivalent of the read authorisation.

To be able to store large amounts of blobs, a unique blob naming scheme
is needed. Additionally, there must be a quick way to find a set of nodes
storing given blob. The DHT-like structure fits here well. It has already
prooven to be working correctly in trackerless torrent networks and
distributed eDonkey protocol (known as Kademlia).

In order to fulfill DHT requirements, each blob is uniquely named using
512-bit (64-byte) identifiers. To have uniform distribution accross whole
range of name values, the naming procedure uses cryptographic hash functions.
Random values are not allowed to prevent trivial blob overwrite attacks.
Instead, the name of a blob must be tightly connected with a blob's content
making it nearly impossible to accidentially or purposefully create a blob
for a particular name.

Additionally to item names, the DHT network requires each client to have
a unique id of the same byte length as the indexed items. In a usual scenario,
such node id is generated randomly. Cinode strengthens this requirement by not
allowing random values here similarly to blob naming. Instead each node is
required to have an assymetric key pair. Node's id is basically a fingerprint
(hash value) of the public key. Such id can be used to validate peer
certificate while establishing TLS/SSL connection making it impossible to fake
a particular id.

