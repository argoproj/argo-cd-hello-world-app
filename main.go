package main

import (
	"net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello world!"))
}

func main() {
	http.HandleFunc("/hello", helloHandler)
	http.ListenAndServe(":8080", nil)
}
