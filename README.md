# vim-rerunner

A plugin for vim that lets you easily map commands to `<cr>`.
Seems trivial. It is.

## Why?

`<cr>` is kind of useless in Normal mode so I usually map it to do some command. Typically it's running a specific test but sometimes it's reloading Chrome. While writing this README it was `w !markdown.pl`. It could be anything.

## How?

`:Rerun !rspec spec` saves the command `!rspec spec` away. Press `<cr>` to run it.

Obviously you could tie it to something fancier like [Dispatch.vim][] or the like.

`:Rerun Dispatch`

The idea is to make it easy to **make it do whatever you're doing the most** right now.

I have project specific `.vimrc`s in most of my projects looking more or less like this:

```vim
" silently run AppleScript that updates chrome
noremap <leader>rc :silent Rerun call system('reload-chrome')<cr>
" mark the current file
noremap <leader>rf :silent Rerun !rspec <c-r>=expand('%')<cr><cr>
" mark the current file and line
noremap <leader>rl :silent Rerun !rspec <c-r>=expand('%').':'.line('.')<cr><cr>
```

It's really up to you.

[Dispatch.vim]: https://github.com/tpope/vim-dispatch
