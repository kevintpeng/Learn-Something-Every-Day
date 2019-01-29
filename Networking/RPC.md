# Remote Procedure Call
- request-response protocol, allowing execution of a function in a different address space
- form of IPC, but enables distributed applications to communicate as if they're local

### gRPC
- framework, which can use protocol buffers as its interface definition language
- server also runs a gRPC server process, to handle calls, and run functions based on defined interfaces
  - from `.proto` files, protoc (compiler) can generate language specific data-access classes
- gRPC supports unary function input/ouputs, or streamed which handles a sequence of messages
