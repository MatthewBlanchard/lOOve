# lOOve

```lua
-- Using my Object library
require "loove"

Game = Object:new()

function Game:Game(text)
	self.text = text
end

function Game:update(dt)
	print(self.text)
end

function Game:draw()
end

love.state(Game:new("Hey, welcome to lOOve."))

-- Also compatible with raw tables or other class libraries
require "loove"

Game = {}

Game.text = "Hey, welcome to lOOve."

function Game:update(dt)
	print(self.text)
end

function Game:draw()
end

love.state(Game)
```