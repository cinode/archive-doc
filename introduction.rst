------------------
Introduction
------------------

When trying to describe the Cinode in just few words, it can be presented as
a network simillar to the Internet but relying on strong cryptography used to
secure data access and authentication in a reliable way.

The network technology, as we know it today (2012), is based on a client-server
architecture. It assumes that the server holds the data and performs operations
on it while the client is used mostly to display the result of such computation.
While the idea works really well and proves itself to be reliable even in the
most complex scenarions, it suffers from high and still underestimated security
flow which is the server's reliability.

The meaning of term "security flaw" is usually understood as a bug in a software
that allow an attacker to gain unauthorised access to our resources and information.
But there are other underestimated areas where flaws may happen. Some of them
purposefully explored by the services we've got used to. This includes such things
like the right to use the information we've added to the service, or the ability
to analyze our behavior by tracking our network activity etc.

Although we still believe that the service providers won't use our
information in a harmful or unethical way, the only guarantee we've got is a social
pressure that could cause a loss of userbase being a result of broken trust.
Another thing to remember is that we can't avoid people's bad intentions.
Even if a web portal was created to server us and increase the quality of our lives,
a person with direct access to the network infrastructure of the service can
purposely use the information for activities we wouldn't like to see.

All those doubts leave us with a question whether we can create such technology
that would protect us from server flows and abuses. The answer is: yes.
There are successfull projects where server administrators use strong cryptography
to secure the data in such way that even those admins can't access it. The
encryption/decryption process is executed on the client side and the encryption
key never leaves client's environment.
Examples of such projects are:

 - Wuala - online backup and storage
 - LastPass - secure cloud-based password manager.


Cinode goals
---------------

Although we've already started to see that the client-side encryption may be
a solution to serious server-side problems, this doesn't solve following ones:

 - We're still bound to one service provider, this means that he can still cause
   some problems when shutting down the service or changing its terms & conditions.
 - We must trust the service provider that his implementation is bug-free
   and that he's telling the truth about his technology design.

Cinode, apart from strong using strong cryptography, is a system that is trying to fix
those problems. 

It was not created to meet requirements of a single application (although
real-life examples were analyzed while designing the system) which helps us use
it in a range of projects.
Second, the data system was created in a decentralized fashion by the use of
technologies like DHT to unbind ourselves from particular service provider
and letting us propagating the data between servesr. Additionaly the access 
security is controlled using strong cryptography which greatly reduces number of
potentially exploitable areas, like the server logic.

What Cinode's is not
-----------------------

Cinode is not a remedy for every problem found in today's internet. Especially
it won't protect much against phishing requests, key sniffers or any other
client-based attacks.

Additionally current structure of Cinode doesn't suit well frequently
changing data files such as databases. This does reduce the set of applications
that can work in Cinode's universe.
