# Setup

## Requirements

- Neovim
- `git`
- `curl`
- `ripgrep`
- `xclip`
- `luarocks`
- `python3`
- `python3-venv`
- `python3-pip`
- `nodejs`

Ubuntu or Debian:

```bash
sudo apt update
sudo apt install -y neovim git curl ripgrep xclip luarocks python3 python3-venv python3-pip
```

Install Node.js if it is not already available:

```bash
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
```

## Install The Config

If you are starting fresh, back up your current Neovim config first.

Clone this repo to:

```bash
~/.config/nvim
```

## First Launch

Open Neovim:

```bash
nvim
```

On first start, `lazy.nvim` will bootstrap plugin installation.

After Neovim is up, run:

```vim
:MasonInstallAll
```

That installs the configured LSP servers, linters, and formatters managed through Mason.

## What Gets Installed By Mason

This config is set up to install tools for:

- LSP: `lua_ls`, `clangd`, `pyright`
- Linters: `luacheck`, `ruff`
- Formatters used by the config: `stylua`, `clang-format`

Some filetypes are configured to use `prettier` through `conform.nvim` for formatting. If you want those formats to work, make sure `prettier` is installed and available in your `PATH`.

## Important External Dependency

Project-wide search with Telescope `live_grep` requires:

```bash
rg
```

Verify it is installed:

```bash
rg --version
```

If `Space fw` fails inside Neovim, run:

```vim
:echo executable('rg')
```

It should print `1`.

## Troubleshooting

### `clang-format` not working

If `:MasonInstall clang-format` fails, link the system binary into Mason manually:

```bash
ln -sf /usr/bin/clang-format ~/.local/share/nvim/mason/bin/clang-format
mkdir -p ~/.local/share/nvim/mason/packages/clang-format
touch ~/.local/share/nvim/mason/packages/clang-format/MASON
echo "/usr/bin/clang-format" > ~/.local/share/nvim/mason/packages/clang-format/exec
chmod +x ~/.local/share/nvim/mason/packages/clang-format/exec
```

### Telescope says `ripgrep` is missing

Install it at the OS level, not through Mason:

```bash
sudo apt install -y ripgrep
```

Then restart Neovim.
