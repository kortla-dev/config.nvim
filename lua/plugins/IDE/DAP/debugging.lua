local M = {
  "mfussenegger/nvim-dap",
  dependencies = {
    "williamboman/mason.nvim",
    { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
  },

  event = { "VeryLazy" },
}

M.config = function()
  local dap = require("dap")
  local dapui = require("dapui")

  dapui.setup()

  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      -- Change this to your path!
      command = vim.fs.normalize(
        vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "packages", "codelldb", "extension", "adapter", "codelldb")
      ),
      args = { "--port", "${port}" },
    },
  }
  --
  --   dap.configurations.rust = {
  --     {
  --       name = "Launch file",
  --       type = "codelldb",
  --       request = "launch",
  --
  --       program = vim.fs.normalize(
  --         vim.fs.joinpath(vim.fn.getcwd(), "target", "debug", vim.fn.fnamemodify(vim.fn.getcwd(), ":t"))
  --       ),
  --
  --       cwd = "${workspaceFolder}",
  --       stopOnEntry = false,
  --       args = {}, -- args passed to debug target
  --     },
  --   }
  --
  --   dap.configurations.cpp = {
  --     {
  --       name = "Launch file",
  --       type = "codelldb",
  --       request = "launch",
  --       program = function()
  --         return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
  --       end,
  --       cwd = "${workspaceFolder}",
  --       stopOnEntry = false,
  --     },
  --   }
  --
  --   dap.configurations.c = dap.configurations.cpp
  --
  --   -- dap.configurations.c = {
  --   --   {
  --   --     name = "Launch file",
  --   --     type = "codelldb",
  --   --     request = "launch",
  --   --
  --   --     program = function()
  --   --       local path = vim.fs.normalize(vim.fs.joinpath(vim.fn.getcwd(), "nox.exe"))
  --   --
  --   --       print(path)
  --   --
  --   --       return path
  --   --     end,
  --   --
  --   --     cwd = "${workspaceFolder}",
  --   --     stopOnEntry = false,
  --   --     args = { "one", "two", "three" }, -- args passed to debug target
  --   --   },
  --   -- }
  --
  --   dap.adapters.python = {
  --     type = "executable",
  --     command = "python",
  --     args = { "-m", "debugpy.adapter" },
  --   }
  --
  --   dap.configurations.python = {
  --     {
  --       type = "python",
  --       request = "launch",
  --       name = "Launch file",
  --       program = "${file}",
  --       pythonPath = function()
  --         return "python"
  --       end,
  --       console = "integratedTerminal",
  --     },
  --   }
  --
  --   vim.g.dotnet_build_project = function()
  --     local default_path = vim.fn.getcwd() .. "/"
  --     if vim.g["dotnet_last_proj_path"] ~= nil then
  --       default_path = vim.g["dotnet_last_proj_path"]
  --     end
  --     local path = vim.fn.input("Path to your *proj file", default_path, "file")
  --     vim.g["dotnet_last_proj_path"] = path
  --     local cmd = "dotnet build -c Debug " .. path .. " > /dev/null"
  --     print("")
  --     print("Cmd to execute: " .. cmd)
  --     local f = os.execute(cmd)
  --     if f == 0 then
  --       print("\nBuild: ✔️ ")
  --     else
  --       print("\nBuild: ❌ (code: " .. f .. ")")
  --     end
  --   end
  --
  --   vim.g.dotnet_get_dll_path = function()
  --     local request = function()
  --       return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
  --     end
  --
  --     if vim.g["dotnet_last_dll_path"] == nil then
  --       vim.g["dotnet_last_dll_path"] = request()
  --     else
  --       if
  --         vim.fn.confirm("Do you want to change the path to dll?\n" .. vim.g["dotnet_last_dll_path"], "&yes\n&no", 2) == 1
  --       then
  --         vim.g["dotnet_last_dll_path"] = request()
  --       end
  --     end
  --
  --     return vim.g["dotnet_last_dll_path"]
  --   end
  --
  --   dap.configurations.cs = {
  --     {
  --       type = "coreclr",
  --       name = "launch - netcoredbg",
  --       request = "launch",
  --       program = function()
  --         if vim.fn.confirm("Should I recompile first?", "&yes\n&no", 2) == 1 then
  --           vim.g.dotnet_build_project()
  --         end
  --         return vim.g.dotnet_get_dll_path()
  --       end,
  --     },
  --   }
  --
  vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
  vim.keymap.set("n", "<F1>", dap.continue)
  vim.keymap.set("n", "<F2>", dap.step_into)
  vim.keymap.set("n", "<F3>", dap.step_over)
  vim.keymap.set("n", "<F4>", dap.step_out)
  vim.keymap.set("n", "<F5>", dap.step_back)

  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end

  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end

  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end

  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end
end

return M
