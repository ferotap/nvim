# Nevim Configuration Files

Configuration files for neovim. Initially the configuration worked for both
neovim and vim but atm I'm focusing on getting nvim properly setup and
configured.

[Plugged](github.com/junegunn/plugged) is used as a plugin manager.

## Vim

NOTE! Not sure if this is working as my latest work is just for neovim.

Link ~/.vimrc to <this_repo_dir>/init.vim:

    ln -s ~/.vimrc <pat_to_this_repo>/init.vim


## Neovim Setup

I'm using neovim built from source files.

Check for the latest instructions in [Installing
Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-source)
and [Building
Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-source).

Here are the steps:

### Clone the repo

    $ git clone https://github.com/neovim/neovim.git

### Compile and Install

    # cd to the neovim repo
    $ cd neovim
    $ make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/tools/neovim
    $ make install


### Set Python for Neovim

See [setting up python for neovim](curl -L
https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer
| bash) for detailed instructions.

This setup is using [pyenv](git clone https://github.com/neovim/neovim.git) to
manage python versions. Pyenv was installed using.
[pyenv-installer](https://github.com/pyenv/pyenv-installer) For this setup the
following was done once:

    $ curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
    $ pyenv update
    $ pyenv install 3.6.0
    $ pyenv virtualenv 3.6.0 neovim3
    $ pyenv activate neovim3
    $ pip install neovim

and the following should be done once per session (in your shell setup or something)

    $ pyenv activate neovim3

Link ~/config/nvim/ to <root_of_this_repo>:

    ln -s ~/.config/nvim/init.vim <path_to_this_repo/init.vim


