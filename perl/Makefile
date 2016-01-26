all:
	docker build -t $(NS)/perl .

clean:
	docker rmi -f $(NS)/perl 2>/dev/null || true
