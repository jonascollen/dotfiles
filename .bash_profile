# Add `~/bin` to the `$PATH`
ZSH_INSTALL_DIR=$HOME/services/zsh
INSTALL_PATH="$ZSH_INSTALL_DIR"
PATH=$PATH:$HOME/.local/bin:$HOME/bin:$INSTALL_PATH/bin
export PATH


# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,aliases}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;