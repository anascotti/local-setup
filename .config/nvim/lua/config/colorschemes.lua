local status, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not status then
    print("Color scheme not found")
    return
end    
