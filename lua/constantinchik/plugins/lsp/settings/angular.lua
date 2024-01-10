local nvim_lsp = require("lspconfig")

local ok, mason_registry = pcall(require, "mason-registry")
if not ok then
  vim.notify("mason-registry could not be loaded")
  return
end

local angularls_path = mason_registry.get_package("angular-language-server"):get_install_path()

local cmd = {
  "ngserver",
  "--stdio",
  "--tsProbeLocations",
  table.concat({
    angularls_path,
    vim.fn.getcwd(),
  }, ","),
  "--ngProbeLocations",
  table.concat({
    angularls_path .. "/node_modules/@angular/language-server",
    vim.fn.getcwd(),
  }, ","),
}

local config = {
  cmd = cmd,
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = cmd
  end,
  root_dir = nvim_lsp.util.root_pattern("angular.json", "project.json", "nx.json"),
}

return config
