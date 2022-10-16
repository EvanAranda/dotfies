-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/emaranda/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/emaranda/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/emaranda/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/emaranda/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/emaranda/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["ayu-vim"] = {
    loaded = true,
    path = "/Users/emaranda/.local/share/nvim/site/pack/packer/start/ayu-vim",
    url = "https://github.com/ayu-theme/ayu-vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/emaranda/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/emaranda/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/emaranda/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\ntheme\bayu\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/emaranda/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n¼\1\0\0\b\0\t\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\2\5\1\18\4\2\0009\2\6\2'\5\a\0009\6\b\0B\6\1\0A\2\2\1K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/emaranda/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\né\2\0\0\n\0\22\0,6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\17\0009\4\3\0009\4\4\0049\4\5\0045\6\a\0009\a\3\0009\a\6\a)\tüÿB\a\2\2=\a\b\0069\a\3\0009\a\6\a)\t\4\0B\a\2\2=\a\t\0069\a\3\0009\a\n\aB\a\1\2=\a\v\0069\a\3\0009\a\f\aB\a\1\2=\a\r\0069\a\3\0009\a\14\a5\t\15\0B\a\2\2=\a\16\6B\4\2\2=\4\3\0034\4\4\0005\5\18\0>\5\1\0045\5\19\0>\5\2\0045\5\20\0>\5\3\4=\4\21\3B\1\2\1K\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\1\0\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/emaranda/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n)\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\vgetcwd\afn\bvimf\0\2\a\2\4\0\16\14\0\1\0X\2\1€4\1\0\0006\2\0\0009\2\1\2'\4\2\0-\5\0\0\18\6\1\0B\2\4\2\18\1\2\0-\2\1\0008\2\0\0029\2\3\2\18\4\1\0B\2\2\1K\0\1\0\3À\0À\nsetup\nforce\15tbl_extend\bvimð\4\1\0\f\1 \0M6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\0019\1\5\1B\1\1\0026\2\0\0'\4\6\0B\2\2\0029\2\a\2\18\4\1\0B\2\2\2\18\1\2\0005\2\b\0005\3\t\0-\4\0\0=\4\n\3=\2\v\0033\4\f\0=\4\r\0033\4\14\0005\5\15\0006\6\2\0009\6\16\0069\6\17\6'\b\18\0'\t\19\0006\n\2\0009\n\20\n9\n\21\n\18\v\5\0B\6\5\0016\6\2\0009\6\16\0069\6\17\6'\b\18\0'\t\22\0006\n\2\0009\n\20\n9\n\23\n\18\v\5\0B\6\5\0016\6\2\0009\6\16\0069\6\17\6'\b\18\0'\t\24\0006\n\2\0009\n\20\n9\n\25\n\18\v\5\0B\6\5\0016\6\2\0009\6\16\0069\6\17\6'\b\18\0'\t\26\0006\n\2\0009\n\20\n9\n\27\n\18\v\5\0B\6\5\0016\6\2\0009\6\20\0069\6\28\0065\b\29\0B\6\2\1\18\6\4\0'\b\30\0B\6\2\1\18\6\4\0'\b\31\0B\6\2\0012\0\0€K\0\1\0\0À\18rust_analyzer\fpyright\1\0\1\17virtual_text\2\vconfig\15setloclist\r<space>q\14goto_next\a]d\14goto_prev\a[d\15open_float\15diagnostic\r<space>e\6n\bset\vkeymap\1\0\2\vsilent\2\fnoremap\2\0\rroot_dir\0\nflags\14on_attach\1\0\0\1\0\1\26debounce_text_changes\3–\1\24update_capabilities\17cmp_nvim_lsp\29make_client_capabilities\rprotocol\blsp\bvim\14lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/emaranda/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/emaranda/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nŒ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\2\21ensure_installed\ball\17auto_install\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/emaranda/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/emaranda/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/emaranda/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/emaranda/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nå\1\0\0\6\0\14\0 6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0009\5\a\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\b\0009\5\t\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\n\0009\5\v\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\f\0009\5\r\0B\1\4\1K\0\1\0\14help_tags\afh\fbuffers\afb\14live_grep\afg\15find_files\aff\6n\bset\vkeymap\bvim\22telescope.builtin\frequire\0" },
    loaded = true,
    path = "/Users/emaranda/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nŒ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\2\21ensure_installed\ball\17auto_install\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n)\0\0\2\0\3\0\0056\0\0\0009\0\1\0009\0\2\0B\0\1\1K\0\1\0\vgetcwd\afn\bvimf\0\2\a\2\4\0\16\14\0\1\0X\2\1€4\1\0\0006\2\0\0009\2\1\2'\4\2\0-\5\0\0\18\6\1\0B\2\4\2\18\1\2\0-\2\1\0008\2\0\0029\2\3\2\18\4\1\0B\2\2\1K\0\1\0\3À\0À\nsetup\nforce\15tbl_extend\bvimð\4\1\0\f\1 \0M6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\0019\1\5\1B\1\1\0026\2\0\0'\4\6\0B\2\2\0029\2\a\2\18\4\1\0B\2\2\2\18\1\2\0005\2\b\0005\3\t\0-\4\0\0=\4\n\3=\2\v\0033\4\f\0=\4\r\0033\4\14\0005\5\15\0006\6\2\0009\6\16\0069\6\17\6'\b\18\0'\t\19\0006\n\2\0009\n\20\n9\n\21\n\18\v\5\0B\6\5\0016\6\2\0009\6\16\0069\6\17\6'\b\18\0'\t\22\0006\n\2\0009\n\20\n9\n\23\n\18\v\5\0B\6\5\0016\6\2\0009\6\16\0069\6\17\6'\b\18\0'\t\24\0006\n\2\0009\n\20\n9\n\25\n\18\v\5\0B\6\5\0016\6\2\0009\6\16\0069\6\17\6'\b\18\0'\t\26\0006\n\2\0009\n\20\n9\n\27\n\18\v\5\0B\6\5\0016\6\2\0009\6\20\0069\6\28\0065\b\29\0B\6\2\1\18\6\4\0'\b\30\0B\6\2\1\18\6\4\0'\b\31\0B\6\2\0012\0\0€K\0\1\0\0À\18rust_analyzer\fpyright\1\0\1\17virtual_text\2\vconfig\15setloclist\r<space>q\14goto_next\a]d\14goto_prev\a[d\15open_float\15diagnostic\r<space>e\6n\bset\vkeymap\1\0\2\vsilent\2\fnoremap\2\0\rroot_dir\0\nflags\14on_attach\1\0\0\1\0\1\26debounce_text_changes\3–\1\24update_capabilities\17cmp_nvim_lsp\29make_client_capabilities\rprotocol\blsp\bvim\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n¼\1\0\0\b\0\t\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\2\5\1\18\4\2\0009\2\6\2'\5\a\0009\6\b\0B\6\1\0A\2\2\1K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nå\1\0\0\6\0\14\0 6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0009\5\a\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\b\0009\5\t\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\n\0009\5\v\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\f\0009\5\r\0B\1\4\1K\0\1\0\14help_tags\afh\fbuffers\afb\14live_grep\afg\15find_files\aff\6n\bset\vkeymap\bvim\22telescope.builtin\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\né\2\0\0\n\0\22\0,6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\17\0009\4\3\0009\4\4\0049\4\5\0045\6\a\0009\a\3\0009\a\6\a)\tüÿB\a\2\2=\a\b\0069\a\3\0009\a\6\a)\t\4\0B\a\2\2=\a\t\0069\a\3\0009\a\n\aB\a\1\2=\a\v\0069\a\3\0009\a\f\aB\a\1\2=\a\r\0069\a\3\0009\a\14\a5\t\15\0B\a\2\2=\a\16\6B\4\2\2=\4\3\0034\4\4\0005\5\18\0>\5\1\0045\5\19\0>\5\2\0045\5\20\0>\5\3\4=\4\21\3B\1\2\1K\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\1\0\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\ntheme\bayu\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
