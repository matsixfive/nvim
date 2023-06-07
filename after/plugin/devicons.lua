require'nvim-web-devicons'.setup {
 color_icons = true;
 default = true;
 strict = true;
 overrides = {
	txt = {
		icon = ''
	}
 },
 override_by_filename = {
	["Pipfile"] = {
		icon = ""
	}
 }
}

-- function dump(o) if type(o) == 'table' then local s = '{ ' for k,v in pairs(o) do if type(k) ~= 'number' then k = '"'..k..'"' end s = s .. '['..k..'] = ' .. dump(v) .. ',' end return s .. '} ' else return tostring(o) end end print(dump(require'nvim-web-devicons'.get_icons()))
