require("kanagawa").setup({
	compile = true,
	keywordStyle = { italic = true, bold = true },

	overrides = function (colors)
        local theme = colors.theme
		return {
			TelescopeTitle = { fg = theme.ui.special, bold = true },
			TelescopePromptNormal = { bg = theme.ui.bg_p1 },
			TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
			TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
			TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
			TelescopePreviewNormal = { bg = theme.ui.bg_dim },
			TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },

            CmpItemAbbrDeprecated = { fg = "#717C7C", bg = "NONE", strikethrough = true },
            CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", bold = true },
            CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", bold = true },
            CmpItemMenu = { fg = "#727169", bg = "NONE", italic = true},

            CmpItemKindField = { fg = "#fceff1", bg = "#E46876" },
            CmpItemKindProperty = { fg = "#fceff1", bg = "#E46876" },
            CmpItemKindEvent = { fg = "#fceff1", bg = "#E46876" },

            CmpItemKindText = { fg = "#dfd8e9", bg = "#957FB8" },
            CmpItemKindKeyword = { fg = "#dfd8e9", bg = "#957FB8" },

            CmpItemKindConstant = { fg = "#4c301e", bg = "#FFA066" },
            CmpItemKindConstructor = { fg = "#4c301e", bg = "#FFA066" },
            CmpItemKindReference = { fg = "#4c301e", bg = "#FFA066" },

            CmpItemKindFunction = { fg = "#252e40", bg = "#7E9CD8" },
            CmpItemKindOperator = { fg = "#252e40", bg = "#7E9CD8" },
            CmpItemKindMethod = { fg = "#252e40", bg = "#7E9CD8" },
            CmpItemKindValue = { fg = "#252e40", bg = "#7E9CD8" },
            CmpItemKindEnumMember = { fg = "#252e40", bg = "#7E9CD8" },

            CmpItemKindInterface = { fg = "#24322f", bg = "#7AA89F" },
            CmpItemKindStruct = { fg = "#24322f", bg = "#7AA89F" },
            CmpItemKindClass = { fg = "#24322f", bg = "#7AA89F" },
            CmpItemKindModule = { fg = "#24322f", bg = "#7AA89F" },
            CmpItemKindEnum = { fg = "#24322f", bg = "#7AA89F" },

            CmpItemKindVariable = { fg = "#453a27", bg = "#E6C384" },

            CmpItemKindUnit = { fg = "#303f3f", bg = "#A3D4D5" },
            CmpItemKindSnippet = { fg = "#303f3f", bg = "#A3D4D5" },
            CmpItemKindFolder = { fg = "#303f3f", bg = "#A3D4D5" },
            CmpItemKindFile = { fg = "#303f3f", bg = "#A3D4D5" },

            -- CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
            -- CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
		}
	end
})

vim.cmd [[ colorscheme kanagawa ]]
