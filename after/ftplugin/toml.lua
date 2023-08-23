local filename = vim.fn.expand "%:t"

if filename ~= "Cargo.toml" then
  return
end

local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
  return
end

cmp.setup.buffer {
  sources = {
    { name = "crates" },
  },
}
