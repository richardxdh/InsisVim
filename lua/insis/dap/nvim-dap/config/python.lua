-- pip install debugpy
local dap = require("dap")
print("tppython..", dap)

local function get_python_path_for_dap()
  if vim.env.CONDA_PREFIX then
    return vim.env.CONDA_PREFIX .. "/bin/python"
  end
  return "python"
end

dap.adapters.python = {
  type = "executable",
  command = get_python_path_for_dap(),
  args = { "-m", "debugpy.adapter" }, --, "--listen", "{host}:{port}" },
}

dap.configurations.python = {
  {
    name = "Launch Current File",
    type = "python",
    request = "launch",
    program = "${file}",
    console = "integratedTerminal",
    justMyCode = false, -- 如果要调试标准库或第三方库，设置为 false
    pythonPath = function()
      return get_python_path_for_dap()
    end,
  },
  -- {
  --   name = "Attach to Remote",
  --   type = "python",
  --   request = "attach",
  --   connect = {
  --     host = "localhost",
  --     port = 5678,
  --   },
  --   justMyCode = false,
  -- },
}
