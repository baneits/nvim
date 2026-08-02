# NVIM for NixOS
Built using vim.pack and lots of mini plugins

## Installation

This config uses nix-wrapper-modules to forego needing to install dotfiles at all. This results in a cleaner, more consistent experience across systems, in order to make it available to a dendritic nix environment.

### Trying
To try the config:
```bash
nix run https://github.com/baneits/nvim.git
```

### Installing
Add the input to your flake:
```nix
{
  inputs = {
    nvim-custom.url = "github.com:baneits/nvim";
  }
}
```

And then add the package to your system config:
```nix
inputs.nvim-custom.packages.${stdenv.hostPlatform.system}.default
```

### Editing and Developing

You can clone this repo to `.config/nvim`, and then use a nix-shell to use a local config instead of the provided bundled binary. This is useful if you want to make modifications to the config and don't want to wait for a push and rebuild to see your changes. This is the main reason this config is separated from the nixos config repo.

### Adding a new language
Add your language in these places

'flake.nix'
```nix
pkgList = with pkgs; [
  # LSPs
  # Add your lsp here

  # Formatting tools
  # Add your formatting tool here
]
```

'lua/completion/conform.lua'
```lua
formatters_by_ft = {
    LanguageName = { "formatting tool" },
},
```

'lua/completion/lsp.lua'
```lua
vim.lsp.enable({
    -- Add your language here
})
```

'lua/completion/treesitter.lua'
```lua
require("nvim-treesitter").install({
    -- Add your language here
})
```

### Potential issues
If you do not plan to use nixpkgs remove the following line in 'lua/completion/lsp.lua'
```lua
expr = '(builtins.getFlake "~/config").nixosConfigurations.' .. lowerHostname .. ".options",
```
