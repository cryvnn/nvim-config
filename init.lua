local utils = require("utils")

require("config.options")
local km = require("config.keymaps")
require("config.lazynvim")
km.after_lazy_keymaps()
require("config.autocmds")

utils.color_overrides.setup_colorscheme_overrides()

vim.cmd.colorscheme("twilight")

utils.fix_telescope_parens_win()
utils.dashboard.setup_dashboard_image_colors()
