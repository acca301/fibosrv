export NS=emc2

INAME=fibosrv
SUBDIRS=alpine perl poet $(INAME)
.PHONY: clean directories test no_container


all: directories $(patsubst %,$(NS)/%, $(SUBDIRS))

$(NS)/%: %/Dockerfile %/Makefile
	@$(MAKE) TGT=$(notdir $@) -C $(notdir $@)
	@touch $@

test: no_container serve
	@sleep 2
	@curl -sS localhost:5000/compute/-10 > $(NS)/test
	@curl -sS localhost:5000/compute/0 >> $(NS)/test
	@curl -sS localhost:5000/compute/5 >> $(NS)/test
	@curl -sS localhost:5000/compute/1600 >> $(NS)/test
	@docker rm -f $(INAME) >/dev/null
	@diff $(NS)/test $(INAME)/test.expected

serve: $(NS)/$(INAME) no_container
	@# docker run -d --name=$(INAME) -v $(abspath $(INAME)/www):/srv/fibosrv -p 5000:5000 $< >/dev/null
	@docker run -d --name=$(INAME) -p 5000:5000 $< >/dev/null

bootstrap: $(NS)/$(INAME) all
	@docker run -ti --rm --name=$(INAME) -v $(abspath $(INAME)/www):/srv/fibosrv $< poet new -d /srv/fibosrv Fibosrv

directories:
	@mkdir -p $(NS)

clean: no_container
	@for dir in $(SUBDIRS); do \
		$(MAKE) TGT=$$dir -C $$dir $@; \
	done
	@rm -rf $(NS)
	@docker images | grep $(NS) | cut -d\  -f 1 | xargs -r docker rmi -f
	@docker images -qf dangling=true | xargs -r docker rmi -f

no_container:
	@docker rm -f $(INAME) >/dev/null 2>&1 || true
