# Print information for all certificates in a bundle

OpenSSL's x509(1) does not work with certificate bundles and can only print information about the first certificate in the bundle.
This tiny script splits the bundle into individual certificates and uses x509(1) to parse each of them so you can quickly
analyze the bundle contents.  The original certificiates are also preserved so the output of the script can be used in lieu
of the original bundle.
