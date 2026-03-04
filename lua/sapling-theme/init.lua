-- sapling-theme: A colorscheme you grow yourself
--
-- Usage:
--   require("sapling-theme").setup({ base = "tokyonight", palette = {}, highlights = {} })
--   vim.cmd.colorscheme("sapling-theme")

local M = {}
M.config = { base = "default", palette = {}, highlights = {} }

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load()
  -- Load base colorscheme first
  vim.cmd.colorscheme(M.config.base)

  -- Apply user highlight overrides
  for group, settings in pairs(M.config.highlights or {}) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
