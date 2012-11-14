Node
####

General description
*******************

Node is a a basic unit crearing the physical Cinode network.
In the simplest (and probably the most common) scenario,
one node is bound to one physical machine.

Each node has it's own assymetric key pair. The fingerprint
of the public key is the id of a node. The assymetric key
must be a 4096-bit RSA key. The fingerprint must be a SHA-512 hash
of DER-encoded public key.

The node should be accessible through some global network
in order to function properly and become a part of nodes mesh.
The current version assumes that nodes are available on the Internet
through either IPv4 or IPv6 protocol.

A communication channel between two particular nodes is made
using TLS 1.1 protocol. The key pair of the node must be used for the
certificate and public key used by the TLS layer.
One node connecting to another one is obliged to verify peer
certificate using peer's known id. Any unmatching certificate
must be quickly rejected and the connection must be immediately closed.

Communication interfaces
************************

Each node provides one or two communication interfaces
depending on the required functionality.

The first, mandatory interface is used to establish direct secure connection
between nodes. This inter-node connectivity forls the physical layer of Cinode
network. It's major purpose is to enable nodes to exchange data blobs between
themselves. Additional functinoality may be implemented in future versions to
allow connection between nodes that are unable to connect directly (using
one or more bridge nodes) and to provide anonymisation mechanisms simillar
to those known from TOR networks.

The purpose of the second interface is to provide an easy access to data
stored inside Cinode for local user's applications. There's no strict requirement
for each Cinode node to provide this interface. In addition to that, the
implementation of this layer is not required to strictly follow the one proposed
later in the documentation. An example (although rather bad one), can be a desktop
GUI application with the direct Cinode support compiled-in. The proposed
implementation on the other hand provides a known established accessnig protocol
that allows standard web-based applications to be rundirectly from the Cinode itself.

Proposed local access interface
*******************************

Te Cinode client can expose it's information
related to a particular used in a form of
web proxy. The same approach has been used in
TOR networks prpving to be secure enough.
There are follo advantages of such approach:

- We can easily provide a local access to files
  throuh a HTTP protocol
- We can controll domain names and use it to
  secure locally running applications using
  standard cross-domain policy protection
- We can block any traffic to web sites outside
  Cinode world or allow only certain hosts to
  be accessible from particular Cinode-hosted application.
- The cinode network may also be used by any other desktop
  aplication since we're using standard proxy protocol.
  For those applications thouh we can not easily use
  cross-domain protection.

The disadvantages of tjis approach are:
  - The used have to fully swit h to the Cinode
    network after setting up the proxy so that
    the access to standa web sites is more
    complicated
  - The implementation of a http proxy may be a bit more
    complicated
  - It does protect wellclients implementing cross-domain
    protection,  desktop apps may stilaccess all host names.

The most secure way to access Cinode would be throuh a web browser plugin
or direct browser's built-in functionaliy. Due to complexity
of such implementation, this mplementation may be postponed
after other access methods are already working and the
Cinode starts gaining more traction.
