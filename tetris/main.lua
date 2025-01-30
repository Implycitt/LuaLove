require 'pieces'
require 'utils'

function love.load()
  love.graphics.setBackgroundColor(255, 255, 255)

  gridXCount = 10
  gridYCount = 18
  inert = {}

  for y = 1, gridYCount do
    inert[y] = {}
    for x = 1, gridXCount do
      inert[y][x] = ' '
    end
  end
  --
  -- temps
  inert[18][1] = 'i'
  inert[17][2] = 'j'
  inert[16][3] = 'l'
  inert[15][4] = 'o'
  inert[14][5] = 's'
  inert[13][6] = 't'
  inert[12][7] = 'z'

  pieceType = 1
  pieceRotation = 1
end

function love.draw()

  for y = 1, gridYCount do
    for x = 1, gridXCount do
      drawBlock(inert[y][x], x, y)
    end
  end

  for y = 1, 4 do
    for x = 1, 4 do
      local block = pieceStructures[pieceType][pieceRotation][y][x]
      if block ~= ' ' then
        drawBlock(block, x, y)
      end
    end
  end
end

function love.keypressed(key) 
  if key == 'x' then 
    pieceRotation = pieceRotation + 1
    -- check after but couldn't this just be done using the modulo operator ??
    if pieceRotation > #pieceStructures[pieceType] then 
      pieceRotation = 1
    end
  elseif key == 'z' then
    pieceRotation = pieceRotation - 1
    if pieceRotation < 1 then
      pieceRotation = #pieceStructures[pieceType]
    end
  end
end

