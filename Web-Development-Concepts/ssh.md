# SSH
Secure Shell (SSH) is a protocol that allows for remote login to operate securely over unsecure networks. SSH uses public key cryptography for authentication.

## Generating SSH key
SSH keys are a way to identify trusted machines without involving passwords. SSH key can be generated and added to GitHub account for example.

`ssh-keygen -t rsa -b 4096 -C "ktpeng@uwaterloo.ca"` Creates a new ssh key using email as a label. Follow prompts.

### Adding 
- `eval "$(ssh-agent -s)"` ensures ssh-agent is enabled.
- `ssh-add ~/.ssh/filename`

### Add to GitHub
- Navigate to Settings/ssh keys
- open ~/.ssh/id_rsa, copy 

To copy to clipboard:
```
$ sudo apt-get install xclip
# Downloads and installs xclip. If you don't have `apt-get`, you might need to use another installer (like `yum`)

$ xclip -sel clip < ~/.ssh/id_rsa.pub
# Copies the contents of the id_rsa.pub file to your clipboard
```


### Checking existing SSH keys
`ls -al ~/.ssh` checks for existing SSH keys.

By default, filename should be one of the following:
- `id_dsa.pub`
- `id_ecdsa.pub`
- `id_ed25519.pub`
- `id_rsa.pub`

