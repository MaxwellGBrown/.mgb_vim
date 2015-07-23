This is my (maxwellgbrown) .vim & .vimrc's so they can be saved.

To setup the vim settings (on unix, duh):
1. $ cd ~
2. $ ln -s <mgb_vim_path>/.vimrc
3. $ ln -s <mgb_vim_path>/.vim

I stole the apache way of thinking when it comes to enabling mods
so I can enable/disable packages real easy.

Vim plugins should be saved in mgb_vim/.vim/plugins
Enable these plugins by making links in mgb_vim/bundle to mgb_vim/.vim/plugins

To enable a vim plugin (on unix, duh):
1. $ cd <mgb_vim_path>/.vim/bundle
2. $ ln -s ../plugins/<plugin_name>

To disable a vim plugin (duh):
1. $ rm <mgb_vim_path>/.vim/bundle/<plugin_name>

Note that because this is a .git repo and a lot of plugins are also .git
repos it's hard to do version control of them. So, because I'm too lazy
to figure out how to do sub-repos, I just removed the .git files in them
(but kept the .gitignores) so I don't have to deal with that right now.
