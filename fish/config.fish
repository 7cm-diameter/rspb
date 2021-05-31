set -x PATH $HOME/.pyenv/bin $PATH
set -x PATH $HOME/.local/bin $PATH
set -x RUST_BACKTRACE 1

eval (starship init fish)
status --is-interactive; and pyenv init - | source

# exa
alias e "exa"
alias el "exa -l"
alias ea "exa -a"
alias eal "exa -la"
alias tree "e -T"

# fzf
alias fcd "cd (fd --type d --hidden | fzf --height 40% --border)"
alias fpdf "fd --full-path $HOME --type file | rg .pdf | fzf --height 40% --border"

# pacman
alias pacman-upgrade "sudo pacman -Syu"
alias pacman-autoremove "sudo pacman -Qdtq | sudo pacman -Rs -"
alias yay-upgrade "yay -Syu"
alias yay-autoremove "yay -Yc"

#poetry
alias poetry-dev "poetry add --dev python-language-server[all] isort pyflakes pycodestyle yapf"

# git
alias git-user-7cm "git config --local user.email "from.this.ridiculous.loop@gmail.com" & git config --local user.name "7cm-diameter""

# exec exa -l and venv_exists just after cd
function cd
  builtin cd $argv; and exa -l
  venv_exists (pwd)
end

# if `.venv` exists in current directory, activate it
function venv_exists
  set dir $argv[1]
  if test $dir != /
    if test -d $dir/.venv
      set -gx PYTHON_VIRTUAL_ENV $dir/.venv/bin/activate.fish
      source $PYTHON_VIRTUAL_ENV
    else
      venv_exists (dirname $dir)
    end
  else
    if test -n "$PYTHON_VIRTUAL_ENV"
      deactivate
      set -e PYTHON_VIRTUAL_ENV
    end
  end
end
