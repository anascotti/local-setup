local status, _ = pcall(vim.cmd, "colorscheme sonokai")
if not status then
    print("Color scheme not found")
    return
end    
