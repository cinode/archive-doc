The Blobstore
#############

A blobstore is an integral part of every node. It's
main purpose is to permamently store blobs the
node is interested in. This may contail blobs used
by local client or may be a copy of blob stored on
another node in order to keep it's backup or to help
distribute the blob across the network efficiently.

The sum of all blobstores in all Cinode nodes forms
the overall datastore for the Cinode network. There's no
other location for storing this data inthe Cinode. There
may be additional files stored by specific clients
but they are not counted as Cinode's data. An example of such
file may be a root private user's key. It's not required
to be stored inside Cinrt (may be kept for backup purposes thoug).

Since the Cinode operates on one global concept of datastore
assuming it's being spread across large number of nodes,
we have to be able to validate whether given blob has
not been crested in order to destroy some information.
Because of this requirement, blob names are basically
created as cryptographically strong hashes of specific
blob properies such as it's content or a public key associated
with he blob. His method ensures that we can not create
a blib assuming it's name

Static blob strucure
********************

Unencrypted content: none
Protection against unauthorised write: blob id identifies the content so changing the content would create another blob
Integrity validation methods: 1. Blob id must be equal to encrypted hash content 2. Blob encryption key mudt be equal to the hash of unencrypted content

Static blob types:

1. Simple file blob

This type is used tor files with a size not more than 16 MB.

The unen rypted content:
- first byte is 0x01 to identify this kind of static blob
- all bytes stsrting from the second one are the bytes of stored file


2. Sparse file blob

This blov type si used to represent files of size larger
than 16 MB. It's content is a list of other blobs with
their encryption keys. The final file content is created
by concatenation of contents of blobs listed in the
order of apperance in a sparse blob.

The unen rypted content is as follows:
- The static blob type: 0x02
- The cumulative file size (7BC integer)
- Number of sub blobs (7BC integer)
* For each blob:
- blob name: lstring
- blob key: lstring

