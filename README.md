### PreRequisite
```bash
sudo apt install luarocks xclip 
```

For Python
```bash
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
```
After Installing and cloning nvim config, :
open `nvim` and perform `:MasonInstallAll` inside nvim. 

### Troubleshooting
```bash
# to set up clang-format in nvim if :MasonInstall clang-format fails:
ln -sf /usr/bin/clang-format ~/.local/share/nvim/mason/bin/clang-format                                 
>>>>>>> aeb9689 (python configuration)
mkdir -p ~/.local/share/nvim/mason/packages/clang-format
touch ~/.local/share/nvim/mason/packages/clang-format/MASON
echo "/usr/bin/clang-format" > ~/.local/share/nvim/mason/packages/clang-format/exec
chmod +x ~/.local/share/nvim/mason/packages/clang-format/exec
```
