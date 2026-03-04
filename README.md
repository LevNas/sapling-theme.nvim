# sapling-theme.nvim

A Neovim colorscheme you grow yourself.

Start from any base colorscheme (or Neovim's default) and override highlight groups via `setup()` to make it your own. Built with [lush.nvim](https://github.com/rktjmp/lush.nvim), so you can use `:Lushify` for live color editing when you're ready to go deeper.

## Requirements

- Neovim >= 0.9
- [lush.nvim](https://github.com/rktjmp/lush.nvim) (optional — for live editing with `:Lushify`)

## Installation

### lazy.nvim

```lua
{
  "LevNas/sapling-theme.nvim",
  dependencies = { "rktjmp/lush.nvim" },
  lazy = false,
  priority = 1000,
  config = function()
    require("sapling-theme").setup({})
    vim.cmd.colorscheme("sapling-theme")
  end,
}
```

## Configuration

Call `setup()` before loading the colorscheme. All options are optional.

```lua
require("sapling-theme").setup({
  -- Base colorscheme loaded first (default: "default")
  base = "tokyonight",
  -- Your color palette (stored for external reference, e.g. statusline)
  palette = {
    red = "#ff6188",
    green = "#a9dc76",
  },
  -- Highlight overrides (passed to nvim_set_hl)
  highlights = {
    Comment = { fg = "#888888", italic = true },
    Function = { fg = "#66d9ef", bold = true },
  },
})
vim.cmd.colorscheme("sapling-theme")
```

### Base colorscheme

Set `base` to load an existing colorscheme first. Your `highlights` are then applied on top, so any groups you don't override inherit from the base. Defaults to `"default"` (Neovim built-in).

```lua
require("sapling-theme").setup({ base = "tokyonight" })
```

### Highlight overrides

The `highlights` table maps group names to attribute tables accepted by `vim.api.nvim_set_hl()`. These are applied after the base colorscheme.

#### Tip: Reference palette colors via a local variable

Define your palette as a local variable and reference it in both `palette` and `highlights`. This keeps colors in sync and gives you type safety — a typo like `p.bluee` becomes `nil` and is caught immediately, unlike a plain string.

```lua
config = function()
  local p = {
    blue   = "#808bed",
    green  = "#cff7d1",
    red    = "#f7768e",
    teal   = "#73daca",
    -- ...
  }

  require("sapling-theme").setup({
    palette = p,
    highlights = {
      Function = { fg = p.blue, bold = true },
      Type     = { fg = p.teal },
      Error    = { fg = p.red },
    },
  })
  vim.cmd.colorscheme("sapling-theme")
end
```

For a full working configuration, see [`examples/colortheme.lua`](examples/colortheme.lua).

## Growing further with Lushify

Once you want to go beyond highlight overrides, you can create your own [lush](https://github.com/rktjmp/lush.nvim) spec and edit colors interactively:

1. Create a lush spec file (see the [lush tutorial](https://github.com/rktjmp/lush.nvim#interactive-lush-tutorial))
2. Open the file and run `:Lushify`
3. Edit colors and see changes reflected in real time

Save and close the file when you are done — Lushify stops automatically.

## License

MIT
