local Path = require("plenary.path")
local ScanDir = require("plenary.scandir")

local function create_class(path)
	-- no path were provided
	if not path then
		return
	end

	-- create complete path
	local src_path = Path:new("./src/"..path)
	local include_path = Path:new("./include/"..path)

	-- get class name
	local path_split = src_path:_split()
	local class_name = path_split[#path_split]

	if not src_path:parent():exists() then
		src_path:parent():mkdir({ parents = true })
	end

	-- create coresponding files
	-- check is there is a include folder
	local header = Path:new(src_path..".h")
	if Path:new("./include"):exists() then
		include_path:parent():mkdir({ parents = true })
		header = Path:new(include_path..".h")
	end
	local source = Path:new(src_path..".c")

	-- write header content
	local class_name_upper = string.upper(class_name)
	local header_content = string.format([[
#ifndef %s_H
#define %s_H

#endif /* %s_H */ ]], class_name_upper, class_name_upper, class_name_upper)
	header:write(header_content, "w")

	-- write source content
	local source_content = string.format([[#include "%s.h"]], class_name)
	source:write(source_content, "w")
end

local function open_class(class_name)
	local header_file = class_name .. ".h"
	local source_file = class_name .. ".c"

	local header_path = ScanDir.scan_dir(".", { search_pattern = header_file })[1]
	local source_path = ScanDir.scan_dir(".", { search_pattern = source_file })[1]

	if header_path == nil or source_path == nil then
		print(class_name .. "was not found or was not unique")
		return
	end

	vim.cmd("tabnew")
	vim.cmd("e " .. header_path)
	vim.cmd("vsp " .. source_path)
end

vim.api.nvim_create_user_command(
	'CreateClass',
	function (opts)
		create_class(opts.fargs[1])
	end,
	{ nargs = 1 }
)

vim.api.nvim_create_user_command(
	'OpenClass',
	function (opts)
		open_class(opts.fargs[1])
	end,
	{ nargs = 1 }
)
