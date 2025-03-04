**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

```bash
sudo apt install luarocks
```

```bash
# to set up clang-format in nvim if :MasonInstall clang-format fails:
ln -sf /usr/bin/clang-format ~/.local/share/nvim/mason/bin/clang-format
mkdir -p ~/.local/share/nvim/mason/packages/clang-format
touch ~/.local/share/nvim/mason/packages/clang-format/MASON
echo "/usr/bin/clang-format" > ~/.local/share/nvim/mason/packages/clang-format/exec
chmod +x ~/.local/share/nvim/mason/packages/clang-format/exec
```
