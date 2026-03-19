# Usage

## Basics

- Leader key: `Space`
- Command mode shortcut: `;`
- Exit insert mode: `jk`

## Search

### Find files

```text
Space ff
```

Opens Telescope file search for the current project.

### Find files including hidden and ignored files

```text
Space fa
```

Useful when you need dotfiles or files normally skipped by `.gitignore`.

### Search text across the full repo

```text
Space fw
```

Runs Telescope `live_grep`, which searches across multiple files in the project.

This depends on `ripgrep` (`rg`) being installed on your system.

### Search only in the current buffer

```text
Space fz
```

This is the Telescope fuzzy finder for the currently open file.

### Search inside the current file with Vim

```text
/pattern
```

This is Vim's built-in search and only searches the current buffer.

## Navigation

### File tree

```text
Space e
```

Focus the file tree.

### New buffer

```text
Space b
```

Open a new empty buffer.

## Telescope Shortcuts

- `Space ff` find files
- `Space fa` find files including hidden and ignored files
- `Space fw` live grep across the repo
- `Space fb` list open buffers
- `Space fh` help tags
- `Space fo` recent files
- `Space fz` fuzzy search current buffer

## LSP

This config enables LSP for:

- Lua via `lua_ls`
- C/C++ via `clangd`
- Python via `pyright`

Common NvChad LSP actions are available once a server attaches.

## Formatting And Linting

Format on save is enabled.

Current formatter setup:

- Lua: `stylua`
- C: `clang-format`
- C++: `clang-format`
- Python: `ruff_fix`, `ruff_format`
- YAML/XML/Xacro/URDF/SRDF: `prettier`

Current linter setup:

- Lua: `luacheck`
- Python: `ruff`

Linting runs on:

- buffer enter
- buffer write
- leaving insert mode

## Theme And Editing Defaults

- Theme: `ayu_dark`
- Indentation: 4 spaces for `shiftwidth`, `tabstop`, and `softtabstop`

## Copilot

`github/copilot.vim` is enabled and loads at startup.
