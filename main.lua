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