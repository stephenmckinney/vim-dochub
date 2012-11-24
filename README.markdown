# dochub.vim

Quickly searches documentation from [DocHub.io](http://dochub.io) for:

* CSS
* DOM
* HTML 
* JavaScript
* JQuery
* PHP
* Python


## Installation

To install using [pathogen.vim](https://github.com/tpope/pathogen.vim):

    cd ~/.vim/bundle
    git clone git://github.com/stephenmckinney/vim-dochub.git

To install using [neobundle.vim](https://github.com/Shougo/neobundle.vim):

    NeoBundle 'stephenmckinney/vim-dochub'

To install using [vundle](https://github.com/gmarik/vundle):

    Bundle 'stephenmckinney/vim-dochub'


## Usage

dochub.vim is enabled by `filetype`. While editing a supported file,
simply place the cursor over a class, property, or method and type `JJ`.
The plugin will then open a new tab in your browser (or a new instance of
the browser) to the related docs. That's it.

| Documentation | Vim Filetypes           |
| :------------ | :---------------------  |
| CSS           | css, scss               |
| HTML          | eruby, html, htmldjango |
| JavaScript    | javascript              |
| PHP           | php                     |
| Python        | python                  |

The wildcards are documentation for DOM and JQuery, since they aren't
associated to a `filetype` they have their own mapping:

* `JD` for DOM Documentation
* `JQ` for JQuery Documentation


## Configuration

By default, dochub.vim uses the `open` command for OS X or the
[xdg-open](http://portland.freedesktop.org/xdg-utils-1.0/xdg-open.html)
command for other OSes to look up the docs. You can easily change the command. 

For example:

    let g:dochub_command='gnome-open'

Furthermore you can choose your own mapping in the following way:

    let g:dochub_mapping='<C-h>'


## Other Documentation Plugins

* Ruby - [vim-ruby-doc](https://github.com/lucapette/vim-ruby-doc)
* Ruby - [ri.vim](https://github.com/danchoi/ri.vim)


## Credit

This plugin started as a fork of [vim-jquery-doc](http://github.com/lucapette/vim-jquery-doc), but became it's own thing.


## License

Copyright (c) Steve McKinney. Distributed under the same terms as Vim itself. See `:help license`.
