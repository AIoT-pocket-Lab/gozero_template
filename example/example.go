// Example/example.go
package exampleCode

import "math/rand"

// ReadNumber create random number
func ReadNumber() int {
	// random number range
	rnr := 10
	//  returns, as an int, a non-negative pseudo-random number in [0,n)
	return rand.Intn(rnr)
}
