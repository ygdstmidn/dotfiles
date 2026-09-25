# dotfiles

シンボリックリンク等の設定

```bash
ln -s ~/dotfiles/lazygit/config.yml ~/.config/lazygit/config.yml
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/.bashrc ~/.bashrc
sudo ln -s ~/dotfiles/keyd /etc/keyd
```

gitの設定

```bash
git config --global commit.template ~/dotfiles/.gitmessage.txt
```
