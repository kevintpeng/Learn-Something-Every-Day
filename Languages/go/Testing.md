# Testing
`go test` and the `testing` package are builtin. 
- a test is a file ending with `_test.go`
- contains a function named `TestXXX`
- use `Error` or `Fail` method to signal failure

Example test:
```go
func TestReverse(t *testing.T) {
	cases := []struct {
		in, want string
	}{
		{"Hello, world", "dlrow ,olleH"},
		{"Hello, 世界", "界世 ,olleH"},
		{"", ""},
	}
	for _, c := range cases {
		got := Reverse(c.in)
		if got != c.want {
			t.Errorf("Reverse(%q) == %q, want %q", c.in, got, c.want)
		}
	}
}
```
