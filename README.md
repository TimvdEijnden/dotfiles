## Tim's dot files

I've started to slowly use neovim and added plugin's step by step. 
I wanted a backup, so I've decided to use a GitHub repo.


First install Plug:
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Then start neovim and run:
`PlugInstall`
