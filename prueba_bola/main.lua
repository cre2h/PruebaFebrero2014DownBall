
local physics = require("physics")
physics.start()


local circle = display.newCircle( display.contentCenterX, display.contentCenterX, 20)
physics.addBody( circle, "dynamic", {density = 1.0, friction= 0.5, bounce= 0.2, radius = 20} )

local floor = display.newRect( 0, display.contentCenterY + 150, display.contentWidth+2400, 5 )
physics.addBody( floor, "static", {density=1.0, friction=0.5, bounce=0.2 } )


for i = 0 , 10 do
	local rectangle = display.newRect( display.contentCenterX + 100, (display.contentCenterY - 100) + (25 * i), 20, 20 )
	physics.addBody( rectangle, "dynamic", {density=1.0, friction=0.5, bounce=0.0} )
	end

function circleTouch(event)
	if event.phase == "began" then

		display.getCurrentStage():setFocus( circle )

	elseif event.phase == "ended" then

		circle:applyLinearImpulse( ((event.xStart - event.x) / 2), ((event.yStart - event.y) / 2), circle.x, circle.y )
		display.getCurrentStage():setFocus(nil)

	end
end

circle:addEventListener( "touch", circleTouch )