1. Clone the files
```bash
cd ~
git clone git@github.com:gundamew/dotfiles.git
```

2. Initialize the submodules
```bash
cd dotfiles/
git submodule update --init
```

3. Create symbolic links
```bash
ln -s dotfiles/vim/vimrc ~/.vimrc
ln -s dotfiles/vim/vim/ ~/.vim
```

4. Install configured bundles
```bash
vim +BundleInstall +qall
```
