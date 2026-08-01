# NVIM For Voidfiles
Built using vim.pack and lots of mini plugins

## Installation

This config uses nix-wrapper-modules to forego needing to install dotfiles at all. This results in a cleaner,
more consistent experience across systems, in order to make it available to a dendritic nix environment.

### Trying
To try the config:
```bash
nix run .
```

### Installing
 TODO

### Editing and Developing

You can clone this repo to `.config/nvim`, and then use a nix-shell to use a local config instead of the provided
bundled binary. This is useful if you want to make modifications to the config and don't want to wait for a push
and rebuild to see your changes. This is the only reason I kept the main config in lua, other than having to rewrite
it in general.
