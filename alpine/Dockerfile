FROM scratch
MAINTAINER acca@cpan.org
COPY sbin/apk.static /sbin/apk
COPY etc/apk/ /etc/apk/
COPY etc/passwd /etc/
COPY etc/group /etc/

# This one to run without shell
RUN [ "/sbin/apk", "--allow-untrusted", "-U", "add", "--initdb", "alpine-keys", "busybox" ]

# Now we have shell
RUN mkdir /root /srv && rm -rf /var/cache/apk/*
