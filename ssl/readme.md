### Generate Self Signed Certificate

```
openssl req -new -x509 -newkey rsa:2048 -sha256 -nodes -keyout devops.key -days 3560 -out devops.crt -config certificate.cnf
```