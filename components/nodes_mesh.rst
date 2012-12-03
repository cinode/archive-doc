Mesh of Nodes
#############

The physical communication layer of the Cinode network is a structure
that can be represented as a bidirectional graph. Each client working
in the network is the graph's node. Connections between clients are
graph edges.

Each node keeps some number of established connections to other nodes.
Those connections are used to issue communication commands between
nodes and also to keep required number of opened DHT connections.
Each connection is periodically tested so that the client can hold
the best connection set.

Each connection is made using TLS 1.1 or later. The peer validation
is done by checking peer's certificate with it's id. The id is known
prior to connection establishment.

**TODO: possible Man-In-The-Middle attack**

The scenario:

#. The node starts connecting to the network
#. The node starts making connections to other nodes
#. A large group of nodes used for the attack starts connecting to the node
#. Each of those nodes is simply proxying the traffic to some other Cinode node
   so that it can execute cross-node actions but also allows gathering some
   statistical informations about the traffic initiated by the node.

If the number of attacking nodes trying to connect will be significantly higher than
the number of all other connections, those fake nodes may analyze most of the 
node's blob traffic. Even though the content of blobs will be useless without
a proper encryption key, the information about the blob usage, especially when
anallyzed on large datasets, may reveal quite important user's information.

**End TODO**


Trusted nodes
-------------

One of thr important aspects of Cinode is the trust.
Similarly to how PGP works, we introdce a concept
of trusted nodes.
A trusted node is the one of id we have verified
usin a highly secure data communication channel
(recommended option iis to meet in the reality and
exchange the id during such meeting).
Such node must also represent a person or entity
we trust we trust and are sure he/she/it will
not act in a way harmful to us.

The list of trusted nodes will be used in future versions of
Cinode in order to allow anonymised distribution of blobs.

Since th network of a trust may also reveal some crucial
information about a specific node, it's advised not to
threat such nodes in any special way while establishing
TLS connections to other nodes.
