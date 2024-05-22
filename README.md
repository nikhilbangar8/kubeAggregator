# kubeAggregator
Custom Data Aggregator


Folder Structure
```sh
KubeAggregator/
.
├── Dockerfile-agent
├── Dockerfile-server
├── Makefile
├── README.md
├── cmd
│   ├── agent
│   │   └── main.go # Main program for the agent
│   └── server
│       └── main.go # Main program for the server
├── deployments
│   └── helm
│       ├── Chart.yaml
│       ├── templates
│       └── values.yaml
├── go.mod
├── go.sum
└── pkg
│   ├── agent
│   │   ├── agent.go  # Agent logic
│   │   └── config.go # Configuration for agents
│   │   ├── kubernetes/
│   │   │   └── client.go # Kubernetes client utilities
│   │   └── types.go      # Common types across the project
│   ├── cron
│   │   └── cronjobs.go
│   └── server
│       ├── server.go   # Server logic
│       ├── handler.go  # HTTP handlers
│       └── config.go   # Configuration for server
└──
```
```go
go build -o agent ./cmd/agent
go build -o server ./cmd/server
```

---
## Commands to Use with Makefile

### Build the Docker Image: This command will use the Dockerfile to build a Docker image based on your Go application.

```sh
make build-all
```
This command runs the build target in your Makefile, which builds your Docker image.

### Run the Docker Container: After building the image, you can run it as a container.
```sh
make run-all
```
This uses the run target in the Makefile to start a Docker container based on the image you built.

### Stop and Remove the Container: To stop the running container and remove it.
```sh
make clean-all
```
### Remove the Docker Image: If you need to remove the Docker image.
```sh
make rmi-all
```
### Testing the Setup
Test the Running Application: Once your container is running, you can test it by accessing it on the configured port. If your service is set up to run on port 8080, you can visit http://localhost:8080 in your browser or use a tool like curl to make requests.

### View Docker Container Logs: To see what’s happening inside your running container, use:
```sh
docker logs [container-name]
```