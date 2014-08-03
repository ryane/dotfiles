colors_dir=~/.vim/colors/

files=(
    Tomorrow-Night-Blue.vim
    Tomorrow-Night-Bright.vim
    Tomorrow-Night-Eighties.vim
    Tomorrow-Night.vim
    Tomorrow.vim
)
url_root="https://raw.githubusercontent.com/chriskempson/vim-tomorrow-theme/master/colors/"

mkdir -p $colors_dir

for i in ${files[@]}; do
    curl $url_root$i -o $colors_dir$i
done
