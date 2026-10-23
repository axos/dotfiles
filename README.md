# axos' dotfiles

## Prerequisites
- Unix-like operating system (macOS or Linux)
- `curl` and/or `wget` should be installed
- `git` should be installed
- [Z shell](https://www.zsh.org/): Install `zsh`
- [Antigen](http://antigen.sharats.me/): Run `curl -L git.io/antigen > ~/.antigen.zsh` in your home folder. Be sure to install it to `.antigen.zsh` (with a `.`)

### Recommended CLI Tools
- [Starship](https://starship.rs/): Fast, cross-shell prompt
- [Zoxide](https://github.com/ajeetdsouza/zoxide): Smarter `cd` command (replaces legacy `fasd`)
- [Eza](https://github.com/eza-community/eza): Modern, maintained replacement for `ls`
- [FZF](https://github.com/junegunn/fzf): Command-line fuzzy finder
- [Navi](https://github.com/denisidoro/navi): Interactive cheatsheet tool

## Getting started

Clone this repo with `git clone https://github.com/axos/dotfiles.git ~/.dotfiles` or `git clone git@github.com:axos/dotfiles.git .dotfiles`. You can also clone this to `git clone`'s default `dotfiles` folder (without the `.`), but it is recommended to clone it into `.dotfiles` in your home directory.

### Symlinking files

Symlink all needed files to your home directory. With this approach all symlinked files in your home directory are actually aliases to the original files in your `.dotfiles` directory. Whenever you change them, the original files are automatically updated in the repository.

#### Example

`ln -sv ~/.dotfiles/.zshrc ~`

### Symlinking with bootstrap script

You can also run the bootstrap script in order to symlink all dotfiles to your home directory. It excludes any files that have `.exclude` in their filename. Run `sh bootstrap.exclude.sh` while in your `.dotfiles` directory.

## Config files

There are config files for
- [Prettier](https://prettier.io/) (`.prettierrc`)
- [sass-lint](https://github.com/sasstools/sass-lint) (`.sass-lint.yml`)
- [stylelint](https://stylelint.io/) (`.stylelintrc.json`)

They can be used as global configuration files or copied to a project folder.

## Machine-Specific Overrides

If you have tool paths, runtimes (like NVM, pnpm, Go), package manager commands, or machine-specific aliases that shouldn't be shared across systems, create local override files:
- `~/.zshrc.local`
- `~/.aliases.local`

They will be automatically sourced by your core configuration and are ignored by Git.

## Acknowledgements

- [@ajmalsiddiqui](https://github.com/ajmalsiddiqui) and his article [How to make your Dotfile management a painless affair](https://www.freecodecamp.org/news/dive-into-dotfiles-part-2-6321b4a73608/)
- [@robbyrussell](https://github.com/robbyrussell) for the awesome [oh-my-zsh](https://ohmyz.sh/)
