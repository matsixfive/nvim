Color = {red = 0xff, green = 0xff, blue = 0xff}
---@param r number
---@param g number
---@param b number
---@return Color
function Color:new(r, g, b)
	r = r or 0xff
	g = g or 0xff
	b = b or 0xff
	setmetatable({}, self)
	self.__index = self
	self.red = r
	self.green = g
	self.blue = b
	return self
end

function Color:fromHex(hex)
	local r, g, b = hex:match("#(%x%x)(%x%x)(%x%x)")
	return Color:new(tonumber(r, 16), tonumber(g, 16), tonumber(b, 16))
end

---@return string
function Color:toHex()
	return string.format("#%02x%02x%02x", self.red, self.green, self.blue)
end

---@param percent number
--- Brighten or darken a color by a percentage
function Color:brighten(percent)
	local amount = math.floor(0xff * percent)
	self.red =   math.min(math.max(0, self.red + amount), 0xff)
	self.green = math.min(math.max(0, self.green + amount), 0xff)
	self.blue =  math.min(math.max(0, self.blue + amount), 0xff)
end

return Color
