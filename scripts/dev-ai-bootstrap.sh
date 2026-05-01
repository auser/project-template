#!/usr/bin/env bash
set -euo pipefail

log() {
  printf '\n==> %s\n' "$1"
}

has() {
  command -v "$1" >/dev/null 2>&1
}

ensure_homebrew() {
  if ! has brew; then
    echo "Homebrew is required for this bootstrap on macOS."
    echo "Install it from https://brew.sh, then rerun this script."
    exit 1
  fi
}

install_brew_packages() {
  log "Installing base packages"
  brew install git jq ripgrep fd just node python@3.12 ollama || true
}

install_codex() {
  log "Installing Codex CLI"
  if has codex; then
    echo "codex already installed"
    return
  fi

  if has npm; then
    npm i -g @openai/codex
  else
    echo "npm is required to install @openai/codex"
    exit 1
  fi
}

install_aider() {
  log "Installing Aider"
  if has aider; then
    echo "aider already installed"
    return
  fi

  python3 -m pip install --user aider-install
  if has aider-install; then
    aider-install
  else
    local pybin
    pybin="$(python3 - <<'PY'
import site
paths = site.getuserbase()
print(paths + "/bin/aider-install")
PY
)"
    "$pybin"
  fi
}

install_opencode() {
  log "Installing OpenCode"
  if has opencode; then
    echo "opencode already installed"
    return
  fi

  curl -fsSL https://opencode.ai/install | bash
}

ensure_ollama_running() {
  log "Ensuring Ollama is available"
  if ! has ollama; then
    echo "ollama was not installed successfully"
    exit 1
  fi

  if ! pgrep -x ollama >/dev/null 2>&1; then
    echo "Starting ollama service"
    ollama serve >/tmp/ollama-bootstrap.log 2>&1 &
    sleep 3
  fi
}

pull_models() {
  log "Pulling local coding models"
  ollama pull qwen2.5-coder:14b || true
  ollama pull qwen2.5-coder:32b || true
}

print_next_steps() {
  cat <<'EOF'

AI agent tooling bootstrap complete.

Recommended commands inside a repo:

  just codex
  just aider
  just opencode
  just claude
  just ci

First-time authentication may still be required for hosted providers.

EOF
}

main() {
  ensure_homebrew
  install_brew_packages
  install_codex
  install_aider
  install_opencode
  ensure_ollama_running
  pull_models
  print_next_steps
}

main "$@"
