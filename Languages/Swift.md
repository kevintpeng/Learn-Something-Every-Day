# Swift
- `println("Hello World")`
- `print("Hello")`
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
- ranges can be defined as: `for i in 1..5`

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
} else { // ...
```

### Implicitly Unwrapped Optionals
If after some logic, an optional may be guaranteed to have a value. At this point, it is useful to remove the need to check and unwrap the optional's value every time.
- An optional is implicitly unwrapped by declaring `String!`. Gives the permission to unwrap optionals automatically

### Error Handling
Optionals communicate success through having a value, or `nil`. Functions communicate through erros.
- `func canThrowAnError() throws {}`
- if a func can throw an error, you prepend `try` before calling a function, followed by `catch`
- `catch Error.MyTypeOfError {}` for specific cases

### Strings
- strings are mutable if `var`s
- strings are value types, value is copied when passed to a function
- string interpolation: `"\(muliplier) times 2.5 is \(Double(multiplier)*2.5)"`
- strings are unicode

### Collection Types
Arrays, Sets, Dictionaries. Collections are mutable; able to add, remove, change items in a collection.
- `Array<Element>` can be shortened as `[Element]`. 
  - empty initializer: `[Element]()`
  - `.enumerate()` method iterates over an array, returning a tuple composed of the `(index, value)`
- Sets store unordered, distinct values of the same type: `Set<String>`
  - sets must be explicitly declared, otherwise they default to arrays
  - sets can be sorted, intersected, XORed, unioned, subtracted and determine equality, subset/superset relationships
- `Dictionary<Key, Value>` can be shorthanded as `[Key: Value]`
  - `var namesOfInts = [String: Int]()`

### Function Definition
`func sayHello(personName: String) -> String {}` (return val is optional, can return tuples). Example:
```swift
let bounds = minMax([8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// Prints "min is -6 and max is 109"
```
- external parameter names let you specify names of parameters when they're called, much like an options hash in ruby
```swift

func sayHello(to person: String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)!"
}
print(sayHello(to: "Bill", and: "Ted"))
```
- you can assign default parameter values: `func someFunction(parameterWithDefault: Int = 12)`
- a function can take an arbitrary number of parameters: `func arithmeticMean(numbers: Double...) -> Double {`, where `numbers` is a list of doubles
- every function has a *function type*, like `(Int, Int) -> Int`
  - `var mathFunc: (Int, Int) -> Int = addTwoInts`; then call `mathFunc(2, 3)` >>> `5`
  
### Classes and Structures
Flexible constructs that are the building blocks for code. Swift does not require you to create separate interface
