The interface for accessing cinode
----------------------------------

The cinode provides simple interface for accessing
filesystem-like structure. This structure doesn't
provide any useful functionality as long as there
are no applications knowong how to operate on such
structure.
ONe could easily create program implementing
interface to the cinode that would let it
become a part of the network. This would work
in simple cases but fails shortly when we realise
that more than one application may want to use
cinode at the same time on the same machine.
This become important since the summaric
cost of disk cache and in-memory data structures
can be significant. There's also no need to keep
such structures separate for different applications
to aboid unnecessary data duplication.
The proposed implementation assumes one
cinode process for one user. It's pupose
would be to keep connected to the cinode
network and hold one on-disk blob
storage. It should also provide easy to
use local api interface that could then be used
by locally running applications. The interface
assumes standard http-based access to the
blob structure in a simplified way hiding
he complexity of blob names, encryption keys
and links.

We can also take thr advantage of a web
interface by writing web-based applications.
Such applications can be hosted in the cinode
itself using dynamic web technologies.
This qpproach would allow anybody with the
cinode node running in the background
let run cinode-hosted apps using standard
web browser. ain addition we would
be protected from various attack
methods by techniques already implemented in
browsers.

Cinode interface for services
-----------------------------

Although the Cinode should not rely on any
particular server to handle it's functionality
it may be used by current internet architecture.
First important usage is the increased data
security since almost all information
will be stored in an encrypted form.
The only weak point here is the securiy
of root keys. A good solution is to encrupt
such keys using user's password. Thus the lack
of passwords stored on the server in plain form
would protect the data. Additionaly the password
hashing could be performed on the client side
guaranteeing that the password is never seen on thr
server at all.

Another good usage for cinode inside a usual
server infrastructure is giving users the
abiliy to access all information stored
on such service in a standarised way.
This would make backups trivial and may
help transferring the information to
another provider or to cinode-based solution.

