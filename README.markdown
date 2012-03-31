# dochub.vim

Quickly searches API Documentation from
[DocHub.io](http://dochub.io) and 
[RubyDoc.info](http://rubydoc.info)
for the following supported `filetypes`:

* CSS
* HTML
* JavaScript
* PHP
* Python
* Ruby


## Installation

To install using [pathogen.vim](https://github.com/tpope/pathogen.vim):

    cd ~/.vim/bundle
    git clone git://github.com/poorlilrichgoy/vim-dochub.git


## Usage

dochub.vim is enabled by `filetype`. While editing a supported file,
simply place the cursor over a class, property, or method and type `HH`.
The plugin will then open a new tab in your browser (or a new instance of
the browser) to the related docs. That's it.


## Configuration

By default, dochub.vim uses the `open` command for OS X or the
[xdg-open](http://portland.freedesktop.org/xdg-utils-1.0/xdg-open.html)
command for other OSes to look up the docs. You can easily change the command. 
For example:

    let g:dochub_command='gnome-open'

Furthermore you can choose your own mapping in the following way:

    let g:dochub_mapping='<C-h>'

## Thanks

This plugin started as a fork of [vim-jquery-doc](http://github.com/lucapette/vim-jquery-doc) and was further inspired by [vim-ruby-doc](http://github.com/lucapette/vim-ruby-doc).

## License

Copyright (c) Steve McKinney. Distributed under the same terms as Vim itself. See `:help license`.
