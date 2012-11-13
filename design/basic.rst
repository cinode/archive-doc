Basic requirements
##################

The Cinode project introduces brand new approach for distributed storage and
application deployment. It breaks the concept of centralised services widely
used today. Instead of a concept of servers and machines, it brings one network
structure as if the whole Cinode was one hudge cluster made of computers,
scaling horizontally with every new node plugged in.

Simillar approach has been introduced in a distributeed searching structure
called DHT that has been added to the torrent network. It enabled removal
of the dependency on tracker servers. The tracking functionality was 
shifted to network nodes instead.

Another example of successfully applied decentralised concept can be observed
in the Bitcoin network. It was implemented in order to create a cryptographically
secure virtual currency. From the technical point of view it assumes that the
network is made of small nodes, all of them realising the same functionality.
The rules of how each node operates but applied to large amount of nodes,
let the whole "network" realise complex operations such as safe money transfer
and virtual currency generation.

Similarly to Bitcoin or Torrent networks, the Cinode consists of large number
of small nodes, all of them sharing the same low-level logic. Combining them
together makes the network really powerfull - just like simple neurons create
complex brain structure.

Although all nodes share the same functionality, some of them may be adjusted
to better fit into a particular task. A good example is a storage node. It can
have some extra properties like: large storage space, RAID matrices and high
uptime. Other nodes can use such node for backup purposes, holding copy of
their own blobstore in it. What they gain is the obvious advantage of a backup.
But in addition to that, the storage node can expose backed up blobs to the
Cinode while their original creators (their nodes actually) went offline.

To sum up, each Cinode node must realise following functinalities:

#. storage
#. data validation
#. blob indexing (DHT)
#. local access interface

Those requirements are detailed in following sections.

