vim-jquery-doc is a little plugin that helps you to look up jQuery API doc
[website](http://api.jquery.com/) more quickly.


Installation
------------

I strongly recommend installing [pathogen.vim](https://github.com/tpope/pathogen.vim).

    cd ~/.vim/bundle
    git clone git://github.com/lucapette/vim-jquery-doc.git

Or you can unzip it in your `~/.vim` directory.

How to use it
-------------

When your cursor is on a jQuery method, type `jj` (or your own mapping, see
settings for that) and the plugin will open a new tab in your browser (or a
new instance of the browser) to the related docs. That's all.

Configure it
------------

By default, the plugin uses the `sensible-browser` command to look up the docs
but you can easily change the command putting the following line in your
vimrc:

    let g:jquery_doc_command='your_command'

Furthermore you can choose your own mapping in the following way:

    let g:jquery_doc_mapping='kk'

License
-------

Copyright (c) Luca Pette. Distributed under the same terms as Vim itself. See `:help license`.
