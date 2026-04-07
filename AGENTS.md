# Project Structure

- This is a LaTeX project for creating Passover Haggadot. The `main.tex` file is at the project root. A Haggadah can be generated for a specific theme by selecting one of the files in the `wine-themes` folder as an input.
- There is a separate project in the `halail` subfolder.

# Agent Implementations & Configurations

## Memory and Rules

- Before saving any memory or adding any rule, explicitly ask the user whether the concept should be: (1) added to AGENTS.md as a general rule applicable across all projects, (2) added to AGENTS.md as a rule specific to this project, or (3) stored as a temporary local memory only relevant to the current active work. The devcontainer environment is ephemeral, so local memory files are rarely the right choice.

## Tooling

- Always use `uv run python` instead of `python3` or `python` when running Python commands.
- Prefer dedicated shell tools over `python3`/`python` for simple one-off tasks: use `jq` for JSON parsing, standard shell builtins for string manipulation, etc. Only reach for `python3` when no simpler tool covers the need.
- Check .devcontainer/devcontainer.json for tooling versions (Python, Node, etc.) when reasoning about version-specific stdlib or tooling behavior.
- For frontend tests, run commands via `pnpm` scripts from `frontend/package.json` — never invoke tools directly (not pnpm exec <tool>, npx <tool>, etc.). ✅ pnpm test-unit  ❌ pnpm vitest ... or npx vitest ...
- For linting and type-checking, prefer `pre-commit run <hook-id>` over invoking tools directly — this matches the permission allow-list and mirrors what CI runs. Key hook IDs: `typescript-check`, `eslint`, `pyright`, `ruff`, `ruff-format`.
- Never rely on IDE diagnostics for ruff warnings — the IDE may not respect the project's ruff.toml config. Run `pre-commit run ruff -a` to get accurate results.
- When running terminal commands, execute exactly one command per tool call. Do not chain commands with &&, ||, ;, or & — this prohibition has no exceptions, even for `cd && ...` patterns. Use absolute paths instead of `cd` to avoid needing to chain. Pipes (|) are allowed for output transformation (e.g., head, tail, grep). If two sequential commands are needed, run them in separate tool calls. Chained commands break the permission allow-list matcher and cause unnecessary permission prompts
- Never use backslash line continuations in shell commands — always write the full command on a single line. Backslashes break the permission allow-list matcher.
- **Never manually edit files in any `generated/` folder.** These files are produced by codegen tooling (typically Kiota) and any manual changes will be overwritten. If a generated file needs to change, update the source (e.g. the OpenAPI schema) and re-run the generator.

<!-- BEGIN BEADS INTEGRATION -->
## Issue Tracking with bd (beads)

**IMPORTANT**: This project uses **bd (beads)** for ALL issue tracking. Do NOT use markdown TODOs, task lists, or other tracking methods.

### Why bd?

- Dependency-aware: Track blockers and relationships between issues
- Git-friendly: Auto-syncs to JSONL for version control
- Agent-optimized: JSON output, ready work detection, discovered-from links
- Prevents duplicate tracking systems and confusion

### Quick Start

**Check for ready work:**

```bash
bd ready --json
```

**Create new issues:**

```bash
bd create "Issue title" --description="Detailed context" -t bug|feature|task -p 0-4 --json
bd create "Issue title" --description="What this issue is about" -p 1 --deps discovered-from:bd-123 --json
```

**Claim and update:**

```bash
bd update bd-42 --status in_progress --json
bd update bd-42 --priority 1 --json
```

**Complete work:**

```bash
bd close bd-42 --reason "Completed" --json
```

**Creating human readable file:**
After every CRUD command on an issue, export it:

```bash
bd export -o .claude/.beads/issues-dump.jsonl
```

### Issue Types

- `bug` - Something broken
- `feature` - New functionality
- `task` - Work item (tests, docs, refactoring)
- `epic` - Large feature with subtasks
- `chore` - Maintenance (dependencies, tooling)

### Priorities

- `0` - Critical (security, data loss, broken builds)
- `1` - High (major features, important bugs)
- `2` - Medium (default, nice-to-have)
- `3` - Low (polish, optimization)
- `4` - Backlog (future ideas)

### Workflow for AI Agents

1. **Check ready work**: `bd ready` shows unblocked issues
2. **Claim your task**: `bd update <id> --status in_progress`
3. **Work on it**: Implement, test, document
4. **Discover new work?** Create linked issue:
   - `bd create "Found bug" --description="Details about what was found" -p 1 --deps discovered-from:<parent-id>`
5. **Complete**: `bd close <id> --reason "Done"`


### Important Rules

- ✅ Use bd for ALL task tracking
- ✅ Always use `--json` flag for programmatic use
- ✅ Link discovered work with `discovered-from` dependencies
- ✅ Check `bd ready` before asking "what should I work on?"
- ❌ Do NOT create markdown TODO lists
- ❌ Do NOT use external issue trackers
- ❌ Do NOT duplicate tracking systems

For more details, see README.md and docs/QUICKSTART.md.

<!-- END BEADS INTEGRATION -->
