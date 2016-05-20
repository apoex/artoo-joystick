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

      def handle_joystick
        publish_joystick(0, connection.axis(0), connection.axis(1))
        publish_turn(connection.axis(2))
        publish_throttle(connection.axis(3))
      end

      def publish_throttle(t)
        publish(event_topic_name("update"), "throttle", {:t => t})
        publish(event_topic_name("throttle"), {:t => t})
      end

      def publish_turn(t)
        publish(event_topic_name("update"), "turn", {:t => t})
        publish(event_topic_name("turn"), {:t => t})
      end

      def publish_joystick(s, x, y)
        publish(event_topic_name("update"), "joystick", {:x => x, :y => y, :s => s})
        publish(event_topic_name("joystick"), {:x => x, :y => y, :s => s})
        publish(event_topic_name("joystick_#{s}"), {:x => x, :y => y})
      end

      def button_map
        BINDING_MAP[:logitech_3d_pro][:button_map]
      end
    end
  end
end
