package main

import (
	"fmt"
)

var (
	commitHash string
	branchName string
)

func main() {
	fmt.Printf(
		"commitHash: %s\nbranchName: %s\n",
		commitHash,
		branchName,
	)
}
