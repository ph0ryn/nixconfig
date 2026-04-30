alias python='python3'
alias pip='pip3'

export PATH="$HOME/.local/bin:$PATH"

# my util functions

fpath=(~/.config/zsh/functions $fpath)
autoload -Uz ~/.config/zsh/functions/*(.:t)

alias mdlint='markdownlint-cli2 "**/*.md" --config ~/.markdownlint-cli2.jsonc'

zle -N jump-ghq
bindkey "^g" jump-ghq

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
