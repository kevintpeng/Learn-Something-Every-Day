# [Cobra](https://github.com/spf13/cobra)
Go library for Go CLI interaction. 
- **Commands** represent actions
- **Args** are things
- **Flags** are modifiers for actions

General pattern is `APPNAME VERB NOUN --ADJECTIVE` or `APPNAME COMMAND ARG --FLAG`

### Commands
defined as 
```go
type Command struct {
    Use string // The one-line usage message.
    Short string // The short description shown in the 'help' output.
    Long string // The long message shown in the 'help <this-command>' output.
    Run func(cmd *Command, args []string) // Run runs the command.
}
```

