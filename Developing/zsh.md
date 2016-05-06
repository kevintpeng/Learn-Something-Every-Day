## oh-my-zsh
`$ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
#### Auto Suggestions
1. Clone this repository into `$ZSH_CUSTOM/plugins` (by default `~/.oh-my-zsh/custom/plugins`)

    ```sh
    git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
    ```

2. Add the plugin to the list of plugins for Oh My Zsh to load:

    ```sh
    plugins=(zsh-autosuggestions)
    ```

3. Start a new terminal session.
#### Syntax Highlighting
Oh-my-zsh is a zsh configuration framework.  It lives at
<http://github.com/robbyrussell/oh-my-zsh>.

To install zsh-syntax-highlighting under oh-my-zsh:

1. Clone this repository in oh-my-zsh's plugins directory:

        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

2. Activate the plugin in `~/.zshrc`:

        plugins=( [plugins...] zsh-syntax-highlighting)

3. Source `~/.zshrc`  to take changes into account:

        source ~/.zshrc

Note that `zsh-syntax-highlighting` must be the last plugin sourced,
so make it the last element of the `$plugins` array.

#### Colour & Theme
https://github.com/oskarkrawczyk/honukai-iterm-zsh
