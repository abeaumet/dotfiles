_Memo_

# Vim default stuff

## Normal mode

- `"<reg>yy` yank in the given register
- `"<reg>p` paste the given register
- register `0` is the default register
- register `+` is the system clipboard register
- `]p` paste and auto-indent
- `zt`, `zz`, `zb` keep the cursor on its current position but scroll the view (Top, Middle or Bottom)
- `#`, `*` previous and next occurrence of a word
- `ZZ` `ZQ` exit and save / exit without saving
- `gv` select the last selection
- `vip` select a paragraph
- `viw` select a word
- `` ` ` `` jump to the latest position (without the space)
- `ga` print the ascii value of the character under the cursor
- `@@` execute last macro
- `zg` add a correct word to the dictionary
- `zw` remove a word from the dictionary
- `z=` show spell proposition(s) from dictionary
- `]s` and `[s` jump to the previous/next spell error
- `^wT` move to a new tab
- `^w]` split and jump to the tag in a new tab

## Insert mode

- `^a` re-insert the text inserted in the previous insert session
- `^o` execute one command in normal mode
- `^u` delete the current line from the cursor position

## Command line mode

- `:reg` list registers and their contents
- `:ls` list opened buffers
- `:chdir` change the working directory

# Customized stuff

## Normal mode

- `^w^w` easy window resizing

- `\a{string}<CR>` align code on {string}
- `\d{move}` [d]elete without storing it in the buffer (works with `d`, `D`, `x`, `X`)
- `\\w` easymotion leader key (see `:help easymotion`)
- `\c<space>` comment line/selection
- `^N ^P ^X` multiple cursors (see `:help multiple-cursors`)
- `K` split the current line
- `M` search man
- `Y` copy to the end of line
- `H` `L` previous/next tab
- `<space>` hide highlighted search matches
- `\r` isolate [r]egion
- `\c` syntax [c]heck
- `\C` automatic syntax [c]heck
- `\fe` [f]ile: [e]xplore
- `\fo` [f]ile: [o]pen
- `\te` [t]ags: [e]xplore
- `\be` [b]buffer: [e]xplore
- `\bo` [b]buffer: [o]pen
- `\ue` [u]ndo: [e]xplore
- `\ve` [v]imrc: [e]dit
- `\vs` [v]imrc: [s]ource
- `]n` and `[n` jump to the previous/next conflict marker
- `crs` convert to `snake_case`
- `crm` convert to `MixedCase`
- `crc` convert to `camelCase`
- `cru` convert to `UPPER_CASE`
- `[<space>` add one line above the cursor (don't move the cursor)
- `[<space>` add one line below the cursor (don't move the cursor)
- `gO` add one line above the cursor (move the cursor)
- `go` add one line below the cursor (move the cursor)
- `\bq` [b]uffer: [q]uit
- `\tn` [t]ab: [n]ew
- `\tq` [t]ab: [q]uit

## Insert mode

- `jj` leave insert mode

- `II` go to start of line
- `AA` go to end of line
- `CC` replace to the end of line
- `OO` insert one line above and move the cursor on it
- `^o^o` insert one line below and move the cursor on it
- `JJ` join the current line with the line below (keep the cursor in place)

## Command line mode

- `:A` alternate between .c/.h, .cpp/.hpp, etc...
- `:Tab /<regex>` align lines matching the given regex

## Visual mode

- `S<delimiter>` write delimiter around the selected area

## All mode

- `^e` ZenCoding leader key (:help zencoding)