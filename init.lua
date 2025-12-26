local utils = require("utils")

require("options")
local km = require("keymaps")
require("lazynvim")
km.after_lazy_keymaps()
require("autocmds")

utils.color_overrides.setup_colorscheme_overrides()

vim.cmd.colorscheme("twilight")

utils.fix_telescope_parens_win()
utils.dashboard.setup_dashboard_image_colors()
