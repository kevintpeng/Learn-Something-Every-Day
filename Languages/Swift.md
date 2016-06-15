# Swift
- `println("Hello World")`
- `let myConst = 42`, `var myVar = 50`
- Type can be explicit or inferred: `let implicitD = 70.0`, `let explicitD: Double = 70`
- arrays as expected (with `var`)
- dictionary: `var dict = ["A": "value1", "B": "value2"]`

Control FLow
```swift
for score in myArray {
  if score > 50 {
    // asdf
  } else {
    // something else
  }
}
```
- an optional value either contains a value or `nil`. Write a question mark after the type to mark as optional
- `var optionalString: String? = "Hello"`
- `for (key, val) in myDict {}`

### Type Safety and Inference
Swift is a type-safe language. Encourages you to be clear about hte type of values your code can work with.
- it performs type checks when compiling code, flagging mis-matched types as errors
- type inference enables a compiler to deduce the type of an expression automatically when it compiles
  - Duck typing
- Swift always chooses double over float

### Numeric Literals
- Integers can be declared as: decimal, binary (`0b` prefix), octal (`0o`), hexadecimal (`0x`), all stored the same, as Ints
- `1.25e2` is `125.0`
- `Int` by default unless optimizing performance or memory usage
- `UInt8`, `Int8` are available, among others
- type cast, using `UInt16(some_other_num)`
- decimals are truncated

### Type Aliases
`typealias AudioSample = UInt16` can be used for more context in code.

### Booleans
`Bool`s can only be `true` or `false`. Type safety prevents non-Boolean values from being used for conditionals.

### Tuples
Tuples group multiple values into a single compound value. Tuples types can be any permutation of any number of different types:
```swift
let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")

// now decompose the tuple into two constants
let (statusCode, statusMessage) = http404Error
```

### Optionals
Use optionals in situations where a value may be absent. It says there is a value, and it equals x, or there isn't a value at all. 
```swift
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber) 
// then convertedNumber is inferred to be an `Int?` type
```
- an optional can be of its base type or `nil`

### Optional Binding
Used to find out whether an optional contains a value, and if so, make it available as a temp const/var:
```swift
if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
}
```

### Implicitly Unwrapped Optionals
If after some logic, an optional may be guaranteed to have a value. At this point, it is useful to remove the need to check and unwrap the optional's value every time.
- An optional is implicitly unwrapped by declaring `String!`
- during class initialization, 
