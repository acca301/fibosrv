[Alpine Linux](http://www.alpinelinux.org/)
============
Forked from [seansummers/docker-alpine-apk-static](https://github.com/seansummers/docker-alpine-apk-static).
Added testing repositories, added `docker build' step

This is a minimum viable Alpine image: only alpine-keys
installed (to allow for signed package installing using
`/sbin/apk.static`).

The repository cache has been updated (with all mirrors),
which actually takes up more than half of the image space.
To install packages with apk, you need the APKINDEXes,
so there's no point in not having them, and it's not trivial
to determine which servers would be the best choice for
a given deployment, so I'm just going with MIRRORS.txt.

You will have to install busybox-static, busybox, 
alpine-baselayout, or alpine-base if you want a shell
(in order of size).

As of 2015-05-19, this image is ~9 MB.

