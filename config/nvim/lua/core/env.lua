local env_vars = {
  { name = 'loaded_netrw',       value = 1 },
  { name = 'loaded_netrwPlugin', value = 1 },
}

for _, opts in ipairs(env_vars) do
  vim.env[opts.name] = opts.value;
end
