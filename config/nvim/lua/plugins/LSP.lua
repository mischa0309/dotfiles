return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = {
                                'vim',
                                'require',
                                'Snacks',
                            }
                        }
                    }
                }
            })
        end,
    },
    {
        "mason-org/mason.nvim",
        opts = {
            registries = {
                "github:mason-org/mason-registry",
                "github:Crashdummyy/mason-registry",
            }
        }
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        opts = {
            automatic_enable = {
                exclude = {
                    "rust_analyzer",
                }
            },
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
        },
        opts = {
            ensure_installed = {
                "lua_ls",
                "gopls",
                "rust-analyzer",
            },
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts = {
            ensure_installed = {
                "lua",
                "go",
                "rust",
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indents = { enable = true },
        },
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false,   -- This plugin is already lazy
    },
    {
        'nvim-java/nvim-java',
        config = false,
        dependencies = {
            "neovim/nvim-lspconfig",
            opts = {
                servers = {
                    -- Your JDTLS configuration goes here
                    jdtls = {
                        -- settings = {
                        --   java = {
                        --     configuration = {
                        --       runtimes = {
                        --         {
                        --           name = "JavaSE-23",
                        --           path = "/usr/local/sdkman/candidates/java/23-tem",
                        --         },
                        --       },
                        --     },
                        --   },
                        -- },
                    },
                },
            },
            setup = {
                jdtls = function()
                    -- Your nvim-java configuration goes here
                    require("java").setup({
                        -- root_markers = {
                        --   "settings.gradle",
                        --   "settings.gradle.kts",
                        --   "pom.xml",
                        --   "build.gradle",
                        --   "mvnw",
                        --   "gradlew",
                        --   "build.gradle",
                        --   "build.gradle.kts",
                        -- },
                    })
                end,
            },
        },
    },
    {
        "seblyng/roslyn.nvim",
        ft = { "cs", "razor" },
        dependencies = {
            {
                "tris203/rzls.nvim",
                config = true,
            },
        },
        config = function()
            local mason_registry = require("mason-registry")

            local rzls_path = vim.fn.expand("$MASON/packages/rzls/libexec")
            local cmd = {
                "roslyn",
                "--stdio",
                "--logLevel=Information",
                "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
                "--razorSourceGenerator=" .. vim.fs.joinpath(rzls_path, "Microsoft.CodeAnalysis.Razor.Compiler.dll"),
                "--razorDesignTimePath=" ..
                vim.fs.joinpath(rzls_path, "Targets", "Microsoft.NET.Sdk.Razor.DesignTime.targets"),
                "--extension",
                vim.fs.joinpath(rzls_path, "RazorExtension", "Microsoft.VisualStudioCode.RazorExtension.dll"),
            }

            vim.lsp.config("roslyn", {
                cmd = cmd,
                handlers = require("rzls.roslyn_handlers"),
                settings = {
                    ["csharp|inlay_hints"] = {
                        csharp_enable_inlay_hints_for_implicit_object_creation = true,
                        csharp_enable_inlay_hints_for_implicit_variable_types = true,

                        csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                        csharp_enable_inlay_hints_for_types = true,
                        dotnet_enable_inlay_hints_for_indexer_parameters = true,
                        dotnet_enable_inlay_hints_for_literal_parameters = true,
                        dotnet_enable_inlay_hints_for_object_creation_parameters = true,
                        dotnet_enable_inlay_hints_for_other_parameters = true,
                        dotnet_enable_inlay_hints_for_parameters = true,
                        dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
                        dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
                        dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
                    },
                    ["csharp|code_lens"] = {
                        dotnet_enable_references_code_lens = true,
                    },
                },
            })
            vim.lsp.enable("roslyn")
        end,
        init = function()
            vim.filetype.add({
                extension = {
                    razor = "razor",
                    cshtml = "razor",
                },
            })
        end,
    },
}
