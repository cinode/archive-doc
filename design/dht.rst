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
