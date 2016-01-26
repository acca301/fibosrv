all:
	docker build -t $(NS)/poet .

clean:
	docker rmi -f $(NS)/poet 2>/dev/null || true
