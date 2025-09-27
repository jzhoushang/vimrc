# vimrc

Simple vim configuration file.

## Dependencies

The following dependencies are needed and should be on the system path:

1. [bat](https://github.com/sharkdp/bat) (additionally, if on ubuntu then need to `alias bat='batcat'`)

Other third-party dependencies the configuration file relies on will be installed through [vim-plug](https://github.com/junegunn/vim-plug). These can be found in the [vimrc](./vimrc) file and are:

1. [coc.nvim](https://github.com/neoclide/coc.nvim)
2. [vimtex](https://github.com/lervag/vimtex)
3. [fzf](https://github.com/junegunn/fzf)[^1]
4. [fzf.vim](https://github.com/junegunn/fzf.vim) 
5. [catppucin](https://github.com/catppuccin/vim)

[^1]: Add `~/.fzf/bin` to the system path if you'd like to use [fzf](https://github.com/junegunn/fzf) outside of vim.

## Installing

To install, run

```sh
$ make install
...
``` 

If [vim-plug](https://github.com/junegunn/vim-plug) is not already installed to `~/.vim/autoload/plug.vim`, it will be installed. Other dependencies will be installed through [vim-plug](https://github.com/junegunn/vim-plug).

If a `~/.vimrc` file already exists, it will be moved to `~/.vimrc.old`.

## Updating

To update, run

```sh
$ make update
...
```

This will move `~/.vimrc` to `./vimrc`, which can then be pushed to github.

