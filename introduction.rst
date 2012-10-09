------------------
Introduction
------------------

When we try to describe the Cinode in just few words, it is usually said to be
a network simillar to the Internet but relying on strong cryptography used to
secure data access and authentication in a reliable way.

The network technology, as we know it today (2012), is based on a client-server
architecture. It assumes that the server holds the data and performs operations
on it while the client is mostly used to display the result of such computation.
While the idea works really well and proves itself to be reliable in even the
most complex scenarions we've come up with, it suffers from high and still
underestimated security flow which is the server's reliability.

When we talk about security flaws, we usually consider bugs in the software that
allow the attacker to gain unauthorised access to our resources and information.
But we underestimate other flaws, very ofter purposefully applied onto web services
we've got used to. This includes the permission to use our information we'e put
onto social networks, the ability to analyze our behavior by tracking our network
activity etc.

Although we still believe that the service providers won't use our
information in a harmful or unethical way, the only guarantee we've got is a social
pressure that would result in loss of users in case a portal would start doing
bad things. We also can't avoid people's bad intentions. Even if a portal was created
to server us and increase the quality of our lives, a person with direct access
to the network infrastructure of the service can purposely use the information for
activities we wouldn't like to be part of.

All those doubts leave us with a question whether we can create such technology
that would protect us from server flows. And the answer is yes.
There are successfull projects where server administrators use strong cryptography
to secure the data even from themselves. Being system administrators doesn't give
them access to data of their users since it's stored and transferred to the client
in an encrypted form. In such system, the user is generating it's master key while
authentication process and use it to gain the access to unencrypted information.
The server never knows this secret key and it's never sent so it can't be spied.
Example of such projects are:
 - Wuala - online backup and storage
 - LastPass - secure cloud-based password manager.

Cinode goals
---------------

Although we started to see that the client-side encryption is a solution to large
server-side problems, this doesn't solve following problems:
 - We're still bound to one service provider, this means that he can still cause
   some problems when shutting down the service or changing it's rules.
 - We must trust the service provider that his implementation is bug-free
   and that he's telling the truth about his technology design.

Cinode tries to solve those problems too. First, it was not created to meet
requirements of a single application (although real-life examples were analyzed
while designing the system) which helps us use it in a range of projects.
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
