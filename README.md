# nvim
This is my neovim config. This is a submodule of my [dotfiles](https://github.com/matsixfive/.dotfiles) repo due to cross-platformness.

## TODO:
- [git-blame](https://github.com/f-person/git-blame.nvim) plugin similar to vscode codelens blame
- `<leader>g*` mapping for git actions e.g. `<leader>ga` to add current file\
- take advantage of `after/ftplugin` directory for filetype specific config e.g. `<leader>m` in rust
- automatic filetype detection based off shebang on first line
  - `#!/usr/bin/bash`
  - `#!/bin/bash`
  - `#!/usr/bin/env bash`
