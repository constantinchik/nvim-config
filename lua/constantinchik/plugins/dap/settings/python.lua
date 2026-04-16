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
    local ok, path = pcall(function()
      return require("mason-registry").get_package("debugpy"):get_install_path()
    end)
    if not ok then
      vim.notify("debugpy not installed. Run :MasonToolsInstall", vim.log.levels.WARN)
      return
    end
    require("dap-python").setup(path .. "/venv/bin/python")
  end,
}
