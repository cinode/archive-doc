=============
The blobstore
=============

The blobstore is a central data point in the Cinode network.
Nodes share the data between themselves cumulatively
creating a global blob namespace.

The data unit in the blobstore is a called a data blob. It's
main purpose is to contain some information, usually in an encrypted form.
The knowledge of blob's data decryption key equals read authorization.
In addition to the content encryption, the blob reveals extra cryptographic
properties used to validate whether an authrized user created the content
of the blob. This mechanism is used to implement write authorization.

Every blob is uniquely identified by it's blob Id (BID). It's main
purpose is to be able to find desired information in a global blob
namespace. In addition to the search ability, BID is used in blob
validation process to ensure that given blob can not be simply
overwritten by generating blob with the same BID.

The BID does not contain any information related to the blob's content
interpretation. This kind of information is stored in unencrypted
blob's data. This hardens the analysis of one's blob graph. The type
information is stored in common header of unencrypted blob's data.
This information is also limited to identify main structures forming
user's blob graph and is not intended to contain information such as
mime type of files. Every type has a unique number assigned, the list
of such types is predefined and should not be altered without a general
public discussion. The summary of blob types along with nubers assigned
to particular types is presented below.


.. include:: validation.txt

.. include:: serialization.txt

.. include:: blobtypes.txt

.. include:: testvectors.txt
