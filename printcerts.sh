#!/bin/csh

if ($#argv < 1) then
	echo "Usage: $0 file"
	exit 64
endif

set file = "$1"
set certs = `cat "$file" | awk '/-----BEGIN CERTIFICATE-----/ {printf("%d,", NR);} /-----END CERTIFICATE-----/ {print NR}'`
if ("$certs" == "") then
	echo "No x509 certificates found in the file!"
	exit 1
endif

foreach p ($certs)
	/usr/bin/sed -n "${p}p" "${file}" | openssl x509 -text -fingerprint
	echo
end
