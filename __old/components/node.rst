Node
####

General description
*******************

Node is a a basic unit crearing the physical Cinode network.
In the simplest (and probably the most common) scenario,
one node is bound to one physical machine.

Each node has it's own assymetric key pair. The fingerprint
of the public key is the id of a node. The assymetric key
must be the RSA key of 4096-bit or more length. The fingerprint
must be the SHA-512 hash of DER-encoded public key
(TODO: What's the standard for this der encoding scheme?).

The node should be accessible through a global network
in order to function properly and become a part of nodes mesh.
The current version assumes that nodes are available on the Internet
through either IPv4 or IPv6 protocol. Although the Cinode allows
creating separate networks, adding even one connection point between
them will allow the merge of such subnetworks. This merge will not
introduce any risk of conflict due to the nature of Cinode network.  

A communication channel between two particular nodes must be made
using TLS 1.1 protocol or later. Protocols with known vulnerabilities
must not be accepted. The key pair of a node must be used to generate the
certificate and public key used in the TLS layer.
A node connecting to another one is obliged to verify peer's
certificate using it's known id. Any node that does not pass this test
must be quickly rejected and the connection must be closed immediately.

Communication interfaces
************************

Each node provides one or two communication interfaces
depending on the required functionality.

The first, mandatory interface is used to establish direct secure connection
between nodes. This inter-node connectivity forms the physical layer of Cinode
network. It's major purpose is to enable nodes to exchange data blobs between
themselves. Additional functinoalities may be implemented in future versions
allowing connection between nodes that are unable to connect directly (using
one or more bridge nodes) and providing anonymisation mechanisms simillar
to those known from TOR networks.

The purpose of the second interface is to provide a simple access to data
stored inside Cinode for local user's applications. There's no strict requirement
for each Cinode node to provide this interface. In addition to that, the
implementation of this layer is not required to even follow the one proposed
later in the documentation. An example (although not recommended), can be a desktop
GUI application with direct Cinode support compiled-in. 
The proposed implementation provides a known established accessnig protocol through
HTTP layer that allows standard web-based applications to be run directly from the Cinode
without the need for any specialized software other than a web browser.

Proposed local access interface
*******************************

The proposed implementation of Cinode's interface for easy data access is a local
web proxy server, simillar to how current TOR networks provide their anonymisation.
This proxy server implements following functionalities:

- Allow accessing Cinode resources as if it was a proxied web server
- Manage Cinode specific hostnames
- (Undecided) Route the traffic to non-Cinode hosts as if it was a usual proxy server

All hostnames managed by the Cinode are referenced using the .cinode master domain.
The entry point address for the local interface is: http://login.cinode/ . On this
page, the user is asked to provide his master private key file and, if used, file's
password. The key file must be the RSA key of 4096 bits at least. 

In order to increase the security, all urls other than the login page will be
generated either randomly or the name will be related to the subset of data
accessible under given url. For instance the url: http://f2f9f70d6524be48.cinode/
may be used right after the successfull login in order to show user's main launch
page, http://9220466a6600ec2c.app.cinode/ may be generated for a particular application
installed on user's system so that the user can link to it on the desktop etc.

