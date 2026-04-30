alias python='python3'
alias pip='pip3'

export PATH="$HOME/.local/bin:$PATH"

# my util functions

alias mdlint='markdownlint-cli2 "**/*.md" --config ~/.markdownlint-cli2.jsonc'

function init_ts() {
  if [ -d ".git" ]; then
    echo ".git directory already exists. Please run this command in an empty directory."
    return 1
  fi
  git clone git@github.com.ph:ph0ryn/ts-base.git .
  rm -rf .git
  git init
  git add .
  git commit -m "Initial commit"
}

## ghq + fzf: Ctrl+G to fuzzy-jump to repository
ghq-fzf() {
  local repo

  repo=$(ghq list | fzf \
    --preview 'bat --color=always --style=plain $(ghq root)/{}/README.md 2>/dev/null || ls -la $(ghq root)/{}' \
    --prompt="repo> " \
    --height 40% \
    --layout=reverse \
    --border)

  if [ -n "$repo" ]; then
    BUFFER="cd -- $(ghq root)/$repo"
    zle accept-line
  fi

  zle reset-prompt
}

zle -N ghq-fzf
bindkey "^g" ghq-fzf

## reload shell
reload-shell() {
  clear
  exec zsh -l
}

zle -N reload-shell
bindkey '^l' reload-shell

# npm cli
export PATH=$PATH:/Users/ph0ryn/.npm-global/bin

# pnpm
export PNPM_HOME="/Users/ph0ryn/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# indexion
export PATH="$HOME/.indexion/bin:$PATH"

# ADB
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools/
export PATH=$PATH:$HOME/Library/Android/sdk/emulator/emulator

# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/ph0ryn/.lmstudio/bin"
# End of LM Studio CLI section

# Added by Antigravity
export PATH="/Users/ph0ryn/.antigravity/antigravity/bin:$PATH"
