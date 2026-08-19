# Codex + CG-Agent

When implementation work can be delegated, use CG-Agent as a Gemini worker.

Example:

```bash
~/ClaudeGravity/CG-Agent.sh --repo "$PWD" --task-file /tmp/gemini-task.md
```

On Windows:

```powershell
& "$HOME\Documents\ClaudeGravity\CG-Agent.cmd" --repo "$PWD" --task-file "$env:TEMP\gemini-task.md"
```

Rules for the supervisor:

- Write a concrete implementation task with acceptance criteria.
- Let Gemini inspect and modify the repository through CG-Agent.
- Never trust the worker's success report by itself.
- After CG-Agent finishes, independently inspect `git diff` and `git status`.
- Run the relevant tests, lint, typecheck and build yourself.
- If review fails, send a narrower remediation task to CG-Agent.
- The Gemini worker must not commit, push, reset hard, or publish changes.
