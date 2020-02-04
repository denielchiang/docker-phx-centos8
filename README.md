# docker-phx-centos8
This is elixir/phoenix developing enviroment base on CentOS 8.

The image file size is **1.52GB** for now, that should be sharnked in the furture.

## Enviroment info
- OS: CentOS 8
- Package manager: [asdf](https://github.com/asdf-vm/asdf)
- Erlang: 22.2.4
- Elixir: 1.10.0
- Phoenix: 1.4.12
- Node: 13.7.0

## Dependency info

### Locale en
- glibc-locale-source
- glibc-langpack-en

### ASDF common plugin deps
- automake
- autoconf
- readline-devel
- ncurses-devel
- openssl-devel
- <del>libyaml-devel</del>, can't find rpm on CentOS 8, even in EPEL for now.
- libxslt-devel
- libffi-devel
- libtool
- unixODBC-devel
- unzip
- curl

### Install common plugin deps
- wget
- git

### Install ASDF Erlang plugin deps
- Development Tools
- <del>wxGTK3-devel</del>, can't find rpm on CentOS8, even in EPEL for now.
- <del>wxBase3</del>, can't find rpm on CentOS8, even in EPEL for now.
- java-1.8.0-openjdk-devel
- libiodbc 
- unixODBC
- erlang-odbc

### Install ASDF Node.js plugin deps
- gpg
- perl
- perl-Digest-SHA
