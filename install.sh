# use this at your own risk
# should be run from the root of the dotfiles dir

dotfiles_dir=`pwd`

ln -s $dotfiles_dir/bundle      ~/.bundle
ln -s $dotfiles_dir/ackrc	      ~/.ackrc
ln -s $dotfiles_dir/gitconfig 	~/.gitconfig
ln -s $dotfiles_dir/githelpers 	~/.githelpers
ln -s $dotfiles_dir/gitignore 	~/.gitignore
ln -s $dotfiles_dir/irbrc 	    ~/.irbrc
ln -s $dotfiles_dir/tmux.conf 	~/.tmux.conf
ln -s $dotfiles_dir/vimrc 	    ~/.vimrc
ln -s $dotfiles_dir/zshenv 	    ~/.zshenv
ln -s $dotfiles_dir/zshrc 	    ~/.zshrc
