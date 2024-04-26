return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path",   -- source for file system paths
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip",     -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "neovim/nvim-lspconfig",
    'hrsh7th/cmp-nvim-lsp',
    "onsails/lspkind.nvim",
    'lukas-reineke/lsp-format.nvim',
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lsp = require('lspconfig')

    local lspkind = require('lspkind')

    local format = require('lsp-format')

    format.setup {}
    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" },  -- text within current buffer
        { name = "path" },    -- file system paths
      }),

      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources(
        {
          {
            name = 'path'
          }
        },
        {
          {
            name = 'cmdline'
          }
        }
      ),
      matching = {
        disallow_symbol_nonprefix_matching = false
      }
    })

    require("lsp-format").setup {}

    local on_attach = function(client, bufnr)
      format.on_attach(client, bufnr)
    end

    -- Set up lspconfig.
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    lsp['lua_ls'].setup({
      on_attach = on_attach,
      capabilities = lsp_capabilities,
    })

    lsp['pyright'].setup({
      on_attach = on_attach,
      capabilities = lsp_capabilities,
    })

    lsp['vimls'].setup({
      on_attach = on_attach,
      capabilities = lsp_capabilities,
    })

    lsp['gopls'].setup({
      on_attach = on_attach,
      capabilities = lsp_capabilities,
    })

    lsp['csharp_ls'].setup({
      on_attach = on_attach,
      capabilities = lsp_capabilities,
      filetypes = { 'cs' },
      root_dir = function()
        return vim.loop.cwd()
      end,
    })

    lsp['asm_lsp'].setup({
      on_attach = on_attach,
      capabilities = lsp_capabilities,
      filetypes = { 'asm', 's', 'S' },
      root_dir = function()
        return vim.loop.cwd()
      end,
    })

    vim.cmd([[LspStart]])
  end,
}
