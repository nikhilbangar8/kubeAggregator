# Image names
SERVER_IMG_NAME=kubeaggregator-server
AGENT_IMG_NAME=kubeaggregator-agent

# Container names
SERVER_CONT_NAME=kubeaggregator-server-container
AGENT_CONT_NAME=kubeaggregator-agent-container

# Ports
SERVER_PORT=8080
AGENT_PORT=8081

# Build the server Docker image
build-server:
	docker build -t $(SERVER_IMG_NAME) -f Dockerfile-server .

# Run the server container
run-server:
	docker run -d --name $(SERVER_CONT_NAME) -p $(SERVER_PORT):8080 $(SERVER_IMG_NAME)

# Build the agent Docker image
build-agent:
	docker build -t $(AGENT_IMG_NAME) -f Dockerfile-agent .

# Run the agent container
run-agent:
	docker run -d --name $(AGENT_CONT_NAME) -p $(AGENT_PORT):8080 $(AGENT_IMG_NAME)

# Stop and remove the server Docker container
clean-server:
	docker stop $(SERVER_CONT_NAME)
	docker rm $(SERVER_CONT_NAME)

# Stop and remove the agent Docker container
clean-agent:
	docker stop $(AGENT_CONT_NAME)
	docker rm $(AGENT_CONT_NAME)

# Remove the server Docker image
rmi-server:
	docker rmi $(SERVER_IMG_NAME)

# Remove the agent Docker image
rmi-agent:
	docker rmi $(AGENT_IMG_NAME)

# Build all images
build-all: build-server build-agent

# Run all containers
run-all: run-server run-agent

# Clean all containers
clean-all: clean-server clean-agent

# Remove all images
rmi-all: rmi-server rmi-agent

# Make all commands (build and run all)
all: build-all run-all
