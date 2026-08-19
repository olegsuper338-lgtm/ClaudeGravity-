#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname -s)" == "Darwin" ]]; then
  INSTALL_DIR="${HOME}/Documents/ClaudeGravity"
else
  INSTALL_DIR="${HOME}/ClaudeGravity"
fi
SCRIPTS_DIR="${INSTALL_DIR}/scripts"
RAW_BASE="${CLAUDEGRAVITY_RAW_BASE:-https://raw.githubusercontent.com/olegsuper338-lgtm/ClaudeGravity-/agent/cg-agent-gemini-worker}"

command -v node >/dev/null 2>&1 || { echo "Node.js не найден. Сначала установите ClaudeGravity." >&2; exit 1; }
command -v acc >/dev/null 2>&1 || { echo "acc не найден. Сначала установите ClaudeGravity." >&2; exit 1; }

mkdir -p "$SCRIPTS_DIR"
curl -fsSL "$RAW_BASE/launchers/scripts/cg-agent.mjs" -o "$SCRIPTS_DIR/cg-agent.mjs"
curl -fsSL "$RAW_BASE/launchers/CG-Agent.sh" -o "$INSTALL_DIR/CG-Agent.sh"
chmod +x "$INSTALL_DIR/CG-Agent.sh" "$SCRIPTS_DIR/cg-agent.mjs"
node --check "$SCRIPTS_DIR/cg-agent.mjs"

echo
echo "CG-Agent установлен: $INSTALL_DIR/CG-Agent.sh"
echo "Пример:"
echo "  $INSTALL_DIR/CG-Agent.sh --repo /path/to/project --task 'Реализуй задачу'"
