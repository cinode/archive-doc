------------------
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
