cd
git clone https://github.com/rasmusoh/dotfiles
ln -s ~/dotfiles/.vimrc ~
ln -s ~/dotfiles/.tmux.conf ~
ln -s ~/dotfiles/.gitconfig ~
ln -s ~/dotfiles/.eslint.json ~
ln -s ~/dotfiles/.gitignore ~
ln -s ~/dotfiles/.config/ ~/.config/
ln -s ~/dotfiles/.Xresources ~
chmod +x $HOME/.config/polybar/launch.sh
