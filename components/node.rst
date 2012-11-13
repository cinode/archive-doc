Node
####

Node is a a basic unit crearing the physical Cinode network.
In the simplest scenario, one node is bound to one
physical machine. 
Each node has it's own assymetric key pair. The fingerprint
of the public key is the id of a node. The assymetric key
is 4096-bit RSA key. He fingerprint is a SHA-512 hash
of DER-encoded public key.
The node must be accessible from any global network
in order to function properly. The current implementation
assumes that nodes are available on the internet through
either IPv4 or IPv6 protocol. The communication channel
between nodes is made using TLS 1.1 protocol. The key pair
of the node must also be used in the TLS layer as a certificate
and a private key.
One node connecting to another one is obliged to verify peer
certificate using the id of a peer. Any unmatching certificate
must be quickly rejected and the connection must be closed
immediately.

Each node provides one or two communication interfaces
depending on it's required functionality. The first and oblidged
inferfsce allows other nodes to connect to this one and
let current node open connection to external nodes.
This interface allow establishment of physical layer of Cinode
network. It's purpose is to:

 - allow nodes to exchange data blobs
 - help establishing connection between nodes that don't have the
   ability to connect directly and
 - provide anonymisation features simillar to TOR networks

The purpose of the second node is to provide
an easy ingerface for local user's applications
to work with Cinode. There's no strict requirement
for each Cinode client to provide one and even if
implemented it's not dtrictly required to follow
the proposed implementation. The proposed implementstion
thouh is designex in such way to allow generic
web-based applications be run from within Cinode
itself.
