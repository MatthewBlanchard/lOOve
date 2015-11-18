function love.state(o)
    love.state = o
end

function love.run()

    assert(love.state, "Please call love.state with a gamestate object.")

    if love.math then
        love.math.setRandomSeed(os.time())
    end

    if love.state.load then love.state:load(arg) end

    -- We don't want the first frame's dt to include time taken by love.load.
    if love.timer then love.timer.step() end

    local dt = 0

    -- Main loop time.
    while true do
        -- Process events.
        if love.event then
            love.event.pump()
            for name, a,b,c,d,e,f in love.event.poll() do
                if name == "quit" then
                    if not love.state.quit or not love.state:quit() then
                        return a
                    end
                end
                love.state[name](a,b,c,d,e,f)
            end
        end

        -- Update dt, as we'll be passing it to update
        if love.timer then
            love.timer.step()
            dt = love.timer.getDelta()
        end

        -- Call update and draw
        if love.state.update then love.state:update(dt) end -- will pass 0 if love.timer is disabled

        if love.graphics and love.graphics.isActive() then
            love.graphics.clear(love.graphics.getBackgroundColor())
            love.graphics.origin()
            if love.state.draw then love.state:draw() end
            love.graphics.present()
        end

        if love.timer then love.timer.sleep(0.001) end
    end

end