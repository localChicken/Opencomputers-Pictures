local GUI = require("GUI")
local buffer = require("doubleBuffering")
local component = require("component")
local reactor = {}
local auto = false
---------------------------------------------------------------------------------------------------------------------------------------------------------
--MainContainer
local mainContainer = GUI.fullScreenContainer()
--MainPanel
mainContainer:addChild(GUI.panel(1, 1, mainContainer.width, mainContainer.height, 0x2D2D2D))
--ReactorSelection
local i = 1
for address, type in component.list("br_reactor") do
  reactor[i] = component.proxy(address)
  i = i+1
end

--ButtonCreating
mainContainer:addChild(GUI.button(2,2,60,6,0xFFFFFF,0x555555,0xAAAAAA,0x2D2D2D,"Turn reactor on")).onTouch = function()
  reactor[1].setActive(true)
end
mainContainer:addChild(GUI.button(64,2,60,6,0xFFFFFF,0x555555,0xAAAAAA,0x2D2D2D,"Turn reactor off")).onTouch = function()
  reactor[1].setActive(false)
end
--Slider
local slider = mainContainer:addChild(GUI.slider(4,10,30,0x66DB80,0x000000,0xFFFFFF,0xAAAAAA,1,10000000,5000000,true,"Prefix: "," postfix."))
slider.roundValues=true
slider.onValueChanged = function (value)
print(value)
end
--Switches
local switch1 = mainContainer:addChild(GUI.switch(55,10,8,0x66DB80,0x1D1D1D,0xEEEEEE,true))
switch1.onStateChanged = function(state)
	print(state[])
end
--Drawing
mainContainer:draw()
buffer.draw(true)
mainContainer:startEventHandling()
