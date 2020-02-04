FROM centos:centos8

ENV ERLANG_VER 22.2.4
ENV ELIXIR_VER 1.10.0
ENV NODE_VER 13.7.0
ENV PHX_VER 1.4.12

# Set the locale(en_US.UTF-8)
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN dnf update && \
        dnf install -y \
        epel-release \

RUN dnf --enablerepo="epel" install -y \
        glibc-locale-source \
        glibc-langpack-en \
        automake \
        autoconf \
        readline-devel \
        ncurses-devel \
        openssl-devel \
        libxslt-devel \
        libffi-devel \
        libtool \
        unixODBC-devel \
        unzip \
        curl \
        wget \
        git

RUN dnf groupinstall -y "Development Tools"
RUN dnf install -y -q \
        libxslt \
        java-1.8.0-openjdk-devel \
        libiodbc \
        unixODBC \
        erlang-odbc \
        gpg \
        perl \
        perl-Digest-SHA

RUN dnf clean all

RUN git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf" --branch v0.7.1 && \
        echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc && \
        echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc && \
        echo -e PATH /home/asdf/.asdf/bin:/home/asdf/.asdf/shims:$PATH && \
        source "$HOME/.asdf/asdf.sh" && \
        asdf plugin-add erlang && \
        asdf install erlang $ERLANG_VER && \
        asdf global erlang $ERLANG_VER && \
        asdf plugin-add elixir && \
        asdf install elixir $ELIXIR_VER && \
        asdf global elixir $ELIXIR_VER && \
        asdf plugin-add nodejs && \
        bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring && \
        asdf install nodejs $NODE_VER && \
        asdf global nodejs $NODE_VER && \
        wget http://download-ib01.fedoraproject.org/pub/fedora/linux/updates/30/Everything/x86_64/Packages/i/inotify-tools-3.14-17.fc30.x86_64.rpm && \
        rpm -ivh inotify-tools-3.14-17.fc30.x86_64.rpm && \
        yes | mix local.hex && \
        yes | mix local.rebar && \
        yes | mix archive.install hex phx_new $PHX_VER

WORKDIR /app
