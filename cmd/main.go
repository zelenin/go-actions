package main

import (
	"flag"
	"fmt"
)

func main() {
	fromVar := flag.String("from", "", "")
	flag.Parse()

	fmt.Printf("Hello, world, from %s!", *fromVar)
}
