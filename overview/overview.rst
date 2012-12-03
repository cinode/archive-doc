Overview
##################

What Cinode is?

It is a new kind of network used to host files and run
web-like applications.
It's fully distributed made of resources cumulatively
shared by network's users.
There' a high pressure on the security guaranteed
by strong encryption methods.

What benefits does it give over the current
client-server model?

The data never leaves the client unencrypted.
No way to spy it.

No vendor lock-in since there's no
central server nor central management.

The identity of users can be greatly protected, the privacy
of users is the central point of the design.

The same mechanics can be used in usual servers
making the user protected even against break-ins
into the server system.


Limitations and cons:

Doesn't provide support for real-time
communication (yet)

Require more cpu power die to strong encryption.



The Cinode project is a brand new kind of distributed network serving
as a storage and application environment. It 
introduces a new approach for distributed storage and
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

