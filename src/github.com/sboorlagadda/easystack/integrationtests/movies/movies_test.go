package movies

import (
	"encoding/json"
	"net/http"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

var _ = Describe("Integration", func() {
	type genre struct {
		MlId string
		Name string
	}
	type review struct {
		MlId     string
		UserName string
		Title    string
		Review   string
		Rating   int
	}
	type Movie struct {
		Title   string
		MlId    string
		Reviews []review
		Genres  []genre
	}
	Describe("Fetching movies", func() {
		It("get movie by Id should retrieve movie", func() {
			var movie Movie

			resp, err := http.Get("http://localhost:9000/movie/1")
			Expect(err).Should(BeNil(), "Error! in fetching movie %s", err)

			defer resp.Body.Close()

			err = json.NewDecoder(resp.Body).Decode(&movie)
			Expect(err).Should(BeNil(), "Error!in decoding movie response %s", err)

			Expect(movie.MlId).To(Equal("1"), "Movie retrieved is not the one requested!")
		})
	})
})
