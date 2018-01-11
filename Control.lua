local GUI = require("GUI")
local buffer = require("doubleBuffering")
local component = require("component")
local reactor = {}
local auto = false
local min, max = 0
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
--Functions
function check()
	if auto == true then
		if max < min then
			
		else
end
--ButtonCreating
mainContainer:addChild(GUI.button(2,2,60,6,0xFFFFFF,0x555555,0xAAAAAA,0x2D2D2D,"Turn reactor on")).onTouch = function()
  reactor[1].setActive(true)
end
mainContainer:addChild(GUI.button(64,2,60,6,0xFFFFFF,0x555555,0xAAAAAA,0x2D2D2D,"Turn reactor off")).onTouch = function()
  reactor[1].setActive(false)
end
local button1 = mainContainer:addChild(GUI.roundedButton(55,15,10,1,0xFFFFFF,0x555555,0xAAAAAA,0x2D2D2D,"Apply"))
--Slider
local slider = mainContainer:addChild(GUI.slider(4,10,30,0x66DB80,0x000000,0xFFFFFF,0xAAAAAA,1,10000000,5000000,true,"Minimum limit: "," ."))
slider.roundValues=true
slider.onValueChanged = function (value)
button1.onTouch = function()
min = value
end
end
local slider1 = mainContainer:addChild(GUI.slider(4,15,30,0x66DB80,0x000000,0xFFFFFF,0xAAAAAA,1,10000000,5000000,true,"Maximum limit: "," ."))
slider1.roundValues=true
slider1.onValueChanged = function (value)
button1.onTouch = function()
max = value
end
end
--Switches
local switch1 = mainContainer:addChild(GUI.switch(55,10,8,0x66DB80,0x1D1D1D,0xEEEEEE,true))
switch1.onStateChanged = function(switch,state)
	auto = switch1.state
		GUI.error(max)
	end
	else
		GUI.error(min)
	end
end
--Check
while true do
	if auto == true then
		if reactor[1]:getEnergyStored() > max then
			reactor[1].setActive(false)
		elseif reactor[1]:getEnergyStored() < min then
			reactor[1].setActive(true)
		end
	end
end
--Drawing
mainContainer:draw()
buffer.draw(true)
mainContainer:startEventHandling()
