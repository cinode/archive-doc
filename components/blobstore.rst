---------------
The Blobstore
---------------



Static blob strucure
---------------------

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
