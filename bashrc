# Add tab completion for SSH hostnames based on ~/.ssh/config,
# ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Source git-completion by Shawn O. Pearce
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
. ~/dotfiles/git-completion.sh

# Load our BASH-related source config files
. ~/dotfiles/bash/env
. ~/dotfiles/bash/config
. ~/dotfiles/bash/aliases
. ~/dotfiles/bash/functions
. ~/dotfiles/bash/help
