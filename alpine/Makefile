SEED = http://mirrors.gigenet.com/alpinelinux/
VERSION = v3.2
ARCH = x86_64

CURL = curl -sL

$(NS)/alpine: sbin/apk.static
	docker build -t $@ .

sbin/apk.static: etc/apk/repositories etc/passwd etc/group
	mkdir -p sbin
	$(eval MIRROR = $(shell sed 1q etc/apk/repositories)/$(ARCH)/)
	$(eval APK = $(shell $(CURL) $(MIRROR) \
		|sed -n 's:.*\(apk-tools-static.*apk\).*$$:\1:p'))
	$(CURL) -z $(APK) $(MIRROR)$(APK) | tar xz $@

etc/apk/repositories: MIRRORS.txt
	mkdir -p etc/apk
	sed 's:$$:$(VERSION)/main:' $< >$@
	sed -e 's:^:@testing :' -e 's:$$:edge/testing:' $< >>$@
	sed -e 's:^:@community :' -e 's:$$:edge/community:' $< >>$@

etc/passwd:
	echo root:x:0:0:root:/root:/bin/sh >$@
	echo www-data:x:100:100:wine:/srv:/bin/sh >>$@
etc/group:
	echo root:x:0: >$@
	echo www-data:x:100: >>$@

MIRRORS.txt:
	$(CURL) -zL $@ $(SEED)/$@ | grep gigenet.com > $@

clean:
	-rm -rf MIRRORS.txt *.apk etc/ sbin/
