package main

import (
	"fmt"

	"github.com/arturyumaev/goworkshop/internal/info"
)

var (
	commitHash string
	branchName string
)

func main() {
	fmt.Printf(
		"commitHash: %s\nbranchName: %s\nuserEmail: %s\n",
		commitHash,
		branchName,
		info.UserEmail,
	)
}
