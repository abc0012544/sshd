# SSHD

SSH VM base on Ubuntu 14.04

Installation

```
docker pull abc0012544/sshd
```

Run with 22 and 80 ports opened:

```
docker run -d -it -p 30022:22 abc0012544/sshd
```

Connect apache VM with following setting:

Login by SSH

```
ssh root@localhost -p 30022

password: Test1234
```
