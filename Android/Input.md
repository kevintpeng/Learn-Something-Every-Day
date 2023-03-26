https://source.android.com/docs/core/interaction/input#input-pipeline

Input Pipeline:
- typically hardware produces signal sent to device driver in the linux kernel. OEMs sometimes need to provide custom drivers for embedded devices with tight system integration
- `EventHub` component reads input events from kernel. `InputReader` decodes input events and produces android input invents.
- Linux event codes are translated to android event codes.
- `InputDispatcher` forwards events to the appropriate window.
