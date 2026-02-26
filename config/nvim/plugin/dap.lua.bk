return {
  {
    "mfussenegger/nvim-dap",
    enabled = false,
    version = "*",
    keys = {
      {
        "<Space>db",
        ":lua require('dap').toggle_breakpoint()<CR>",
        desc = "[D]ap toggle [B]reakpoint"
      },
      {
        "<Space>do",
        ":lua require('dap').continue()<CR>",
        desc = "[D]ap [C]ontinue (with dapui)"
      },
    },
    config = function(_, opts)
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    enabled = false,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      -- automaticaly open dapui
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "leoluz/nvim-dap-go",
    enabled = false,
    version = "*",
    config = function()
      local dap_go = require("dap-go")
      dap_go.setup()
    end
  },
}
