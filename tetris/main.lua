require 'pieces'
require 'utils'

function love.load()
  love.graphics.setBackgroundColor(255, 255, 255)

  gridXCount = 10
  gridYCount = 18
  inert = {}
  pieceType = 1
  pieceRotation = 1
  pieceX = 3
  pieceY = 0
  timer = 0
  pieceXCount = 4
  pieceYCount = 4

  for y = 1, gridYCount do
    inert[y] = {}
    for x = 1, gridXCount do
      inert[y][x] = ' '
    end
  end

  function canPieceMove(testX, testY, testRotation)
    for y = 1, pieceYCount do
      for x = 1, pieceXCount do 
        local testBlockX = testX + x
        local testBlockY = testY + y
        if pieceStructures[pieceType][testRotation][y][x] ~= ' ' and (
          (testBlockX) < 1
          or (testBlockX) > gridXCount
          or (testBlockY) > gridYCount
          or inert[testBlockY][testBlockX] ~= ' '
        ) then
          return false
        end
      end
    end
    return true
  end

  -- temps
  inert[8][5] = 'z'

end

function love.update(dt)
  timer = timer + dt
  if timer >= 0.5 then
    timer = 0

    local testY = pieceY + 1
    if canPieceMove(pieceX, testY, pieceRotation) then
      pieceY = testY
    end
  end
end

function love.draw()

  for y = 1, gridYCount do
    for x = 1, gridXCount do
      drawBlock(inert[y][x], x, y)
    end
  end

  for y = 1, pieceYCount do
    for x = 1, pieceXCount do
      local block = pieceStructures[pieceType][pieceRotation][y][x]
      if block ~= ' ' then
        drawBlock(block, x + pieceX, y + pieceY)
      end
    end
  end
end

function love.keypressed(key) 
  if key == 'x' then
    local testRotation = pieceRotation + 1
    if testRotation > #pieceStructures[pieceType] then
      testRotation = 1
    end

    if canPieceMove(pieceX, pieceY, testRotation) then
      pieceRotation = testRotation
    end


  elseif key == 'z' then
    local testRotation = pieceRotation - 1
    if testRotation < 1 then
      testRotation = #pieceStructures[pieceType]
    end

    if canPieceMove(pieceX, pieceY, testRotation) then
      pieceRotation = testRotation
    end

  elseif key == 'left' then
    local testX = pieceX - 1
    if canPieceMove(testX, pieceY, pieceRotation) then
      pieceX = testX
    end

  elseif key == 'right' then
    local testX = pieceX + 1
    if canPieceMove(testX, pieceY, pieceRotation) then
      pieceX = testX
    end
  end
end

