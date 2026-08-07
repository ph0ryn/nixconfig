generate-commit-message() {
  if ! git diff --cached --quiet --exit-code; then
    codex e \
      -m gpt-5.6-luna \
      -c 'model_reasoning_effort="xhigh"' \
      -c 'model_verbosity="low"' \
      -c 'agents.enabled=false' \
      -c 'features.multi_agent_v2=false' \
      -c 'web_search="disabled"' \
      -c 'hide_agent_reasoning=true' \
      --sandbox read-only \
      --ephemeral \
      -- 'git diff --cached を確認し、差分がなければ git diff を確認して、コミットメッセージだけを出力。'
  fi
}

init-repo() {
  local template_repo

  case "$1" in
    ts | typescript)
      template_repo="ts-base"
      ;;
    py | python)
      template_repo="py-template"
      ;;
    *)
      print -u2 "Usage: init-repo <ts|py>"
      return 1
      ;;
  esac

  rm -f .DS_Store
  git clone --depth 1 "git@github.com:ph0ryn/${template_repo}.git" . || return 1
  rm -rf .git
  git init
  git add .
  git commit -m "Initial commit"
}

jump-ghq() {
  local repo root

  repo=$(ghq list | fzf \
    --preview 'repo={}; root=$(ghq root); bat --color=always --style=plain "$root/$repo/README.md" 2>/dev/null || ls -la "$root/$repo"' \
    --prompt="repo> " \
    --height 40% \
    --layout=reverse \
    --border)

  if [[ -n "$repo" ]]; then
    root=$(ghq root)
    BUFFER="cd -- ${(q)root}/${(q)repo}"
    zle accept-line
  fi

  zle reset-prompt
}
