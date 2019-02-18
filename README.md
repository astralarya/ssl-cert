# ssl-cert
Scripts for generating self-signed SSL certificates

## Server Setup
Copy `generate-cert-example.sh` to `generate-cert-MYSERVER.sh`.
Modify this file to configure the SSL Subject for your server

Run `generate-cert-MYSERVER.sh -root` to generate the root CA certificate.
Then run `generate-cert-MYSERVER.sh` to generate the server certificate.

Add the following line to crontab:
```
0 0 1 * * /PATH/TO/generate-cert-MYSERVER.sh
```

## Client Setup
Download the root CA certificate, by default in `~/.ssl/crt/root-selfsigned.crt`.
Follow instructions for your Operating System to install the certificate.
