all:
	docker build -t $(NS)/$(TGT) .

clean:
	docker rmi -f $(NS)/$(TGT) 2>/dev/null || true
	sudo rm -rf www/data/cache/session/* www/data/obj/* www/logs/* www/comps/tmp/*
