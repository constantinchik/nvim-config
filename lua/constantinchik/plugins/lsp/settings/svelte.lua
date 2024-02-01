return {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.js", "*.ts" },
      callback = function(ctx)
        if client.name == "svelte" then
          client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
        end
      end,
    })
  end,
}
