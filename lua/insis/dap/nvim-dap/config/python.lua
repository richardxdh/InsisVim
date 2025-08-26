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

-- load run.lua
local function load_run_config(run_lua_path)
  -- loadfile 加载文件，返回一个函数或 nil + error
  local chunk, err = loadfile(run_lua_path)
  if not chunk then
    vim.notify("[dap-python] loadfile error: " .. err, vim.log.levels.WARN)
    return nil
  end

  -- 使用 pcall 保护调用，防止文件执行错误导致崩溃
  local ok, result = pcall(chunk)
  if not ok then
    vim.notify("[dap-python] run.lua execution error: " .. result, vim.log.levels.WARN)
    return nil
  end

  -- result 应该是一个表（配置数组）
  if type(result) == "table" then
    return result
  else
    vim.notify("[dap-python] run.lua did not return a table", vim.log.levels.WARN)
    return nil
  end
end

local function append_project_run_configs()
  local cwd = vim.fn.getcwd()
  local run_lua_path = cwd .. "/run.lua"

  if vim.fn.filereadable(run_lua_path) == 1 then
    local run_config_list = load_run_config(run_lua_path)
    if run_config_list then
      for _, cfg in ipairs(run_config_list) do
        if type(cfg) == "table" and cfg.name and cfg.type and cfg.request then
          table.insert(dap.configurations.python, 1, cfg)
        else
          vim.notify("[dap-python] Invalid config format in run.lua, ignored", vim.log.levels.WARN)
        end
      end
      vim.notify("[dap-python] Loaded project run.lua debug configurations", vim.log.levels.INFO)
    end
  end
end
-- 执行追加操作
append_project_run_configs()
