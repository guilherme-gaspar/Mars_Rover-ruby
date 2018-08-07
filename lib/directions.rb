def turn_left(step = 1)
  face_to('-', step)
end

def turn_right(step = 1)
  face_to('+', step)
end

def move_forward
  case @face
  when 'N'
    @y += 1
  when 'S'
    @y -= 1
  when 'E'
    @x += 1
  when 'W'
    @x -= 1
  end

  [@y, @x]
end