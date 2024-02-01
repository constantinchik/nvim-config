-- Function to check if running under WSL
local function is_wsl()
  if vim.fn.has("win32") == 1 and vim.fn.executable("wsl.exe") == 1 then
    return true
  else
    return false
  end
end

-- Set clipboard provider commands for WSL
-- Make sure that you have xclip and xsel installed on your linux subsystem:
-- sudo apt-get install xclip xsel
if is_wsl() then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank -i --crlf",
      ["*"] = "win32yank -i --crlf",
      ["x"] = "win32yank -i --crlf",
      ["y"] = "win32yank -i --crlf",
    },
    paste = {
      ["+"] = "win32yank -o --lf",
      ["*"] = "win32yank -o --lf",
      ["x"] = "win32yank -o --lf",
      ["y"] = "win32yank -o --lf",
    },
    cache_enabled = 1,
  }
end
