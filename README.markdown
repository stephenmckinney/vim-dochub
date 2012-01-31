vim-jquery-doc is a little plugin that helps you to look up jQuery API doc
[website](http://api.jquery.com/) more quickly.

If you want something similar for Ruby/Rspec/Rails see
[vim-ruby-doc](http://github.com/lucapette/vim-ruby-doc).

Installation
------------

I strongly recommend installing [pathogen.vim](https://github.com/tpope/pathogen.vim).

    cd ~/.vim/bundle
    git clone git://github.com/lucapette/vim-jquery-doc.git

Or you can unzip it in your `~/.vim` directory.

How to use it
-------------

When your cursor is on a jQuery method, type `JJ` (or your own mapping, see
settings for that) and the plugin will open a new tab in your browser (or a
new instance of the browser) to the related docs. That's all.

Configure it
------------

By default, the plugin uses the
[xdg-open](http://portland.freedesktop.org/xdg-utils-1.0/xdg-open.html)
command to look up the docs but you can easily change the command. For
example, if you are OSX you would like to change it to:

    let g:jquery_doc_command='open'

Furthermore you can choose your own mapping in the following way:

    let g:jquery_doc_mapping='KK'

Roadmap
-------

The only feature I've already planned to add is commands for searching
arbitrary stuff. Something like `:JqueryDoc foo` for example. I'd like to add
support for Windows but I'm not going to do it. So pull-requests are more than
welcome. If you have suggestion, I'll be glad to hear it from you.

Know Issues
-----------

At this very moment, the plugins works only with GUI versions of Vim. I've
planned to fix that. Anyway, a pull-request would be more than welcome. If you
run into other issues, please open one here on github.

License
-------

Copyright (c) Luca Pette. Distributed under the same terms as Vim itself. See `:help license`.
