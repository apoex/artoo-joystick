require 'artoo'

connection :joystick, :adaptor => :joystick
device :controller, :driver => :logitech_3d_pro, :connection => :joystick, :interval => 0.1

work do
  on controller, :joystick => proc { |*value|
    puts "joystick #{value[1][:s]} x:#{value[1][:x]} y:#{value[1][:y]}"
  }
  on controller, :button_fire => proc { |*value|
    puts "fire action!"
  }
  on controller, :button_side => proc { |*value|
    puts "side action!"
  }
  on controller, :button_top_down_left => proc { |*value|
    puts "top_down_left action!"
  }
  on controller, :button_top_down_right => proc { |*value|
    puts "top_down_right action!"
  }
  on controller, :button_top_up_left => proc { |*value|
    puts "top_up_left action!"
  }
  on controller, :button_top_up_right => proc { |*value|
    puts "top_up_right action!"
  }
  on controller, :button_bottom_up_left => proc { |*value|
    puts "bottom_up_left action!"
  }
  on controller, :button_bottom_up_right => proc { |*value|
    puts "bottom_up_right action!"
  }
  on controller, :button_bottom_middle_left => proc { |*value|
    puts "bottom_middle_left action!"
  }
  on controller, :button_bottom_middle_right => proc { |*value|
    puts "bottom_middle_right action!"
  }
  on controller, :button_bottom_down_left => proc { |*value|
    puts "bottom_down_left action!"
  }
  on controller, :button_bottom_down_right => proc { |*value|
    puts "bottom_down_right action!"
  }
end
