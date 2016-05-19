require 'artoo/drivers/joystick'

module Artoo
  module Drivers
    # The Logitech 3D controller driver behaviors
    class Logitech3dPro < Artoo::Drivers::Joystick

      def publish_button(b)
        if button_values[b] == 1
          publish(event_topic_name("button_#{button_map[b]}"))
        else
          publish(event_topic_name("button_up_#{button_map[b]}"))
        end
        super
      end

      def button_map
        BINDING_MAP[:logitech_3d_pro][:button_map]
      end
    end
  end
end
