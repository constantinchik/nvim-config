return {
  "mfussenegger/nvim-dap-python",
  keys = {
    {
      "<leader>dPt",
      function()
        require("dap-python").test_method()
      end,
      desc = "Debug Method",
      ft = "python",
    },
    {
      "<leader>dPc",
      function()
        require("dap-python").test_class()
      end,
      desc = "Debug Class",
      ft = "python",
    },
  },
  config = function()
    local ok, pkg = pcall(function()
      return require("mason-registry").get_package("debugpy")
    end)
    if not ok or not pkg:is_installed() then
      vim.notify("debugpy not installed. Run :MasonToolsInstall", vim.log.levels.WARN)
      return
    end
    local path = pkg:get_install_path()
    require("dap-python").setup(path .. "/venv/bin/python")
  end,
}
