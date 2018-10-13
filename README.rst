=======
mgb_vim
=======

This is MaxwellGBrown's .vim & .vimrc setup.


------------
Installation
------------

1. Go to your home directory

   $ cd ~

2. Checkout repository

   $ git checkout git@github.com:MaxwellGBrown/.mgb_vim.git

3. Link the .vimrc

   $ ln -s .mgb_vim/.vimrc .vimrc

4. Link the .vim

   $ ln -s .mgb_vim/.vim .vim

5. Enable vim plugins
   (See Enabling Plugins Section)


----------------
Enabling Plugins
----------------

Vim plugins should be saved in mgb_vim/.vim/plugins/ as git submodules.

Enable plugins by making links in mgb_vim/.vim/bundle/ to mgb_vim/.vim/plugins/


  $ ln -s ~/.vim/plugins/<plugin_name> ~/.vim/bundle/<plugin_name>

Disable plugins by deleting the symbolic link to that plugin.

  $ rm ~/.vim/bundle/<plugin_name>


--------------
Adding Plugins
--------------

Plugins should be added to mgb_vim/.vim/plugins as git submodules.

  $ git submodule add <Submodule Repository URL> mgb_vim/.vim/plugins/

  $ git commit -m "Added Plugin <plugin name>"


Don't forget to Enable the plugin after adding it!


----------------
Updating Plugins
----------------

Because plugins are saved as git submodules they need to be maintained as such.

  $ cd mgb_vim/.vim/plugins/<plugin_directory>

  $ git fetch && git pull

  $ cd ..

  $ git add .

  $ git commit -m "Updated <plugin_name>"
