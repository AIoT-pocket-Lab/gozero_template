// Example/example_test.go
package exampleCode

import "testing"

func TestReadNumber(t *testing.T) {
	tests := []struct {
		name string
		want int
	}{
		// TODO: Add test cases.
		{
			"exampleCode1",
			1,
		}, {
			"exampleCode2",
			2,
		}, {
			"exampleCode3",
			3,
		}, {
			"exampleCode4",
			4,
		},{
			"exampleCode5",
			5,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := ReadNumber(); got != tt.want {
				t.Errorf("ReadNumber() = %v, want %v", got, tt.want)
			}
		})
	}
}
