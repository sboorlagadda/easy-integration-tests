package movies_test

import (
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"

	"testing"
)

func TestMovies(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "Movies Suite")
}
