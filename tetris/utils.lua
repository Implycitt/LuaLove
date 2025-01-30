blockSize = 20
blockDrawSize = blockSize - 1
colors = {
  [' '] = {.87, .87, .87},
  i = {.47, .76, .94},
  j = {.93, .91, .42},
  l = {.49, .85, .76},
  o = {.92, .69, .47},
  s = {.83, .54, .93},
  t = {.97, .58, .77},
  z = {.66, .83, .46},
}

function drawBlock(block, x, y)
  local color = colors[block]
  love.graphics.setColor(color)
  love.graphics.rectangle(
    'fill',
    (x - 1) * blockSize,
    (y - 1) * blockSize,
    blockDrawSize,
    blockDrawSize
  )
end
