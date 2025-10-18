return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      local colors = {
        bg = "#1e1e2e",
        fg = "#cdd6f4",
        blue = "#89b4fa",
        green = "#a6e3a1",
        violet = "#cba6f7",
        orange = "#fab387",
        red = "#f38ba8",
        yellow = "#f9e2af",
        grey = "#313244",
        cyan = "#89dceb",
        pink = "#f5c2e7",
        teal = "#1abc9c",
      }

      local function mode_color()
        local m = vim.fn.mode()
        local mode_colors = {
          n = colors.blue,
          i = colors.green,
          v = colors.violet,
          V = colors.violet,
          ["␖"] = colors.violet,
          R = colors.red,
          c = colors.orange,
        }
        return mode_colors[m] or colors.blue
      end

      -- Nvim logo
      local nvim_logo = {
        function()
          return ""
        end,
        color = function()
          return { fg = colors.bg, bg = mode_color() }
        end,
        separator = { left = "", right = "" },
        padding = { left = 1, right = 1 },
      }

      -- Mode display (no bg)
      local mode_display = {
        function()
          local modes = {
            n = "NORMAL",
            i = "INSERT",
            v = "VISUAL",
            V = "V-LINE",
            ["␖"] = "V-BLOCK",
            c = "COMMAND",
            R = "REPLACE",
          }
          return modes[vim.fn.mode()] or "OTHER"
        end,
        color = { fg = colors.fg, bg = "NONE", gui = "bold" },
        separator = { left = "", right = "" },
        padding = { left = 1, right = 1 },
      }

      -- File icon with dynamic bg for many languages
      local function get_file_icon()
        local icons = {
          lua = { icon = "", color = colors.violet },
          cpp = { icon = "", color = colors.blue },
          c = { icon = "", color = colors.blue },
          h = { icon = "", color = colors.blue },
          python = { icon = "", color = colors.yellow },
          js = { icon = "", color = colors.yellow },
          ts = { icon = "", color = colors.blue },
          php = { icon = "", color = colors.violet },
          html = { icon = "", color = colors.orange },
          css = { icon = "", color = colors.blue },
          json = { icon = "", color = colors.orange },
          md = { icon = "", color = colors.green },
          sh = { icon = "", color = colors.green },
          go = { icon = "", color = colors.blue },
          java = { icon = "", color = colors.red },
          rs = { icon = "", color = colors.orange },
          yaml = { icon = "", color = colors.blue },
          toml = { icon = "", color = colors.violet },
          txt = { icon = "", color = colors.grey },
          default = { icon = "", color = colors.grey },
        }
        local ft = vim.bo.filetype
        return icons[ft] or icons.default
      end

      local file_icon = {
        function()
          local icon_data = get_file_icon()
          return icon_data.icon
        end,
        color = function()
          local icon_data = get_file_icon()
          return { fg = colors.bg, bg = icon_data.color }
        end,
        separator = { left = "", right = "" },
        padding = { left = 1, right = 1 },
      }

      -- Filename (polosan, no bg)
      local filename_display = {
        function()
          local filename = vim.fn.expand("%:t")
          if filename == "" then
            filename = "[No Name]"
          end
          return filename
        end,
        color = { fg = colors.fg, bg = "NONE" },
        separator = { left = "", right = "" },
        padding = { left = 1, right = 1 },
      }

      local cwd_display = {
        function()
          local path = vim.fn.expand("%:p:h")
          if path == "" then
            return ""
          end
          return " " .. vim.fn.fnamemodify(path, ":t")
        end,
        color = { fg = colors.orange, bg = "NONE" },
        padding = { left = 1, right = 0 },
      }

      -- LSP client name
      local lsp_name = function()
        local msg = ""
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        for _, client in ipairs(vim.lsp.get_active_clients()) do
          if client.config.filetypes and vim.fn.index(client.config.filetypes, buf_ft) ~= -1 then
            return " " .. client.name
          end
        end
        return msg
      end

      local diagnostics = {
        "diagnostics",
        sources = { "nvim_lsp" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
        diagnostics_color = {
          error = { fg = colors.red },
          warn = { fg = colors.yellow },
          info = { fg = colors.blue },
          hint = { fg = colors.green },
        },
        separator = { left = "", right = "" },
      }

      local encoding_fileformat = {
        {
          "encoding",
          color = { fg = colors.violet, bg = "NONE" },
        },
        {
          "fileformat",
          icons_enabled = true,
          color = { fg = colors.violet, bg = "NONE" },
        },
      }

      local clock = {
        function()
          return os.date(" %H:%M")
        end,
        color = { fg = colors.bg, bg = colors.cyan },
        separator = { left = "", right = "" },
        padding = { left = 1, right = 1 },
      }

      -- CPU & RAM usage
      local cpu = { "CPU: 0%", color = { fg = colors.orange } }
      local ram = { "RAM: 0%", color = { fg = colors.orange } }
      local function update_sysinfo()
        local handle = io.popen("top -bn1 | grep 'Cpu(s)' | awk '{print $2+$4}'")
        if handle then
          local result = handle:read("*a")
          handle:close()
          cpu[1] = "CPU: " .. string.format("%.0f%%", tonumber(result) or 0)
        end
        handle = io.popen("free -m | awk 'NR==2{printf \"%d\", $3*100/$2 }'")
        if handle then
          local result = handle:read("*a")
          handle:close()
          ram[1] = "RAM: " .. (tonumber(result) or 0) .. "%"
        end
        vim.defer_fn(update_sysinfo, 5000)
      end
      update_sysinfo()

      -- Formatter & linter
      local formatter_linter = function()
        local ft = vim.bo.filetype
        local formatters =
          { lua = "stylua", python = "black", js = "prettier", php = "php-cs-fixer", html = "prettier" }
        local linters = { lua = "luacheck", python = "pylint", js = "eslint", php = "phpcs", html = "htmllint" }
        return string.format("Fmt:%s | Lint:%s", formatters[ft] or "-", linters[ft] or "-")
      end

      return {
        options = {
          theme = "auto",
          section_separators = "",
          component_separators = "",
          globalstatus = true,
          disabled_filetypes = { "dashboard", "alpha" },
        },
        sections = {
          lualine_a = { nvim_logo },
          lualine_b = { mode_display, file_icon, filename_display, cwd_display },
          lualine_c = { diagnostics },
          lualine_x = {
            { lsp_name, color = { fg = colors.green } },
            unpack(encoding_fileformat),
            { formatter_linter, color = { fg = colors.yellow } },
            cpu,
            ram,
          },
          lualine_y = { clock },
          lualine_z = {
            {
              "location",
              color = { fg = colors.bg, bg = colors.blue },
              separator = { left = "", right = "" },
              padding = { left = 1, right = 1 },
            },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { "nvim-tree", "lazy" },
      }
    end,
  },
}
