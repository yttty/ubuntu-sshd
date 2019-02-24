# ubuntu-vim-ycm-sshd
Dockeroized Ubuntu with vim, YouCompleteMe and SSH service, built on top of offical Ubuntu 18.04

## Basic Usage
#### Authentication by password
```
$ docker run --rm \
--publish=8022:22 \
--env ROOT_PASSWORD=MyRootPW123 \
yttty/ubuntu-vim-ycm-sshd
```

After the container is up you are able to ssh in it as root with the in --env provided password for "root"-user.
```
$ ssh root@mydomain.tld -p 8022
```
#### Authentication by ssh-keypair
```
$ docker run --rm \
--publish=8022:22 \
--env KEYPAIR_LOGIN=true \
--volume /path/to/authorized_keys:/root/.ssh/authorized_keys \
yttty/ubuntu-vim-ycm-sshd
```
After the container is up you are able to ssh in it as root with a private-key which matches the provided public-key in authorized_keys for "root"-user.
```
$ ssh root@mydomain.tld -p 8022 -i /path/to/private_key
```

## Installed package
- openssh-server
- build-essential
- cmake
- python3-dev
- curl
- git
- vim (with various plugin)

## Issues
If you run into any problems with this image, please check (and potentially file new) issues on the [yttty/ubuntu-vim-ycm-sshd](https://github.com/yttty/ubuntu-vim-ycm-sshd) repo, which is the source for this image.

## Inspired by
This image is inspired by [rastasheep/ubuntu-sshd](https://github.com/rastasheep/ubuntu-sshd), [aphecetche/docker-vim](https://github.com/aphecetche/docker-vim), [JDevlieghere/dotfiles](https://github.com/JDevlieghere/dotfiles)
