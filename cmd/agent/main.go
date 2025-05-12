package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	log.Println("Received request from", r.RemoteAddr)
	fmt.Fprintf(w, "Hello, this is KubeAggregator agent. Your request was processed.")
}

func main() {
	// Set up logging to output to standard output (console)
	log.SetOutput(os.Stdout)
	log.SetFlags(log.Ldate | log.Ltime | log.Lshortfile)

	log.Println("Starting the KubeAggregator agent...")
	log.Println("Agent is configured to listen on port 8080")

	http.HandleFunc("/", handler)

	// Wrap the ListenAndServe call with log.Fatal to log if the server fails to start
	log.Fatal(http.ListenAndServe(":8080", nil))
}
