love.filesystem.setIdentity("RTA TEST") -- where saved images will go
local lg, li = love.graphics, love.image
if lg then
  error("Tests do not support love.graphics yet")
end

local TA = require("RTA")

local png1 = li.newImageData("1.png")
local png2 = li.newImageData("2.png")
local png3 = li.newImageData("3.png")

-- FixedSize
local fixedSizeAtlas = function(padding, extrude, spacing)
  local ta  = TA.newFixedSize(16, 16, padding, extrude, spacing)
  ta:add(png1, 1):add(png2, 2):add(png3, 3)
  local _, data = ta:hardBake()
  data:encode("png", "fixedSize_"..padding.."_"..extrude.."_"..spacing..".png")
end

fixedSizeAtlas(0, 0, 0)
fixedSizeAtlas(1, 0, 0)
fixedSizeAtlas(0, 1, 0)
fixedSizeAtlas(0, 0, 1)
fixedSizeAtlas(1, 1, 1)
fixedSizeAtlas(5, 2, 5)

-- DynamicSize
local dynamicSizeAtlas = function(padding, extrude, spacing)
  local ta  = TA.newDynamicSize(padding, extrude, spacing)
  ta:add(png1, 1):add(png2, 2):add(png3, 3)
  local _, data = ta:hardBake()
  data:encode("png", "dynamicSize_"..padding.."_"..extrude.."_"..spacing..".png")
end

dynamicSizeAtlas(0, 0, 0)
dynamicSizeAtlas(1, 0, 0)
dynamicSizeAtlas(0, 1, 0)
dynamicSizeAtlas(0, 0, 1)
dynamicSizeAtlas(1, 1, 1)
dynamicSizeAtlas(5, 2, 5)

love.event.quit()