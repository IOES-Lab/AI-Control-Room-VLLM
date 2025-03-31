import rclpy
from rclpy.node import Node
from geometry_msgs.msg import Twist
import termios
import sys
import tty

KEY_BINDINGS = {
    'w': (1.0, 1.0),
    's': (-1.0, -1.0),
    'a': (-0.5, 0.5),
    'd': (0.5, -0.5),
    'q': (0.0, 0.0)
}

class WamvKeyboardControl(Node):
    def __init__(self):
        super().__init__('wamv_keyboard_control')
        self.publisher = self.create_publisher(Twist, '/cmd_vel', 10)

    def get_key(self):
        tty.setraw(sys.stdin.fileno())
        key = sys.stdin.read(1)
        termios.tcsetattr(sys.stdin, termios.TCSADRAIN, termios.tcgetattr(sys.stdin))
        return key

    def control_loop(self):
        twist = Twist()
        try:
            while rclpy.ok():
                key = self.get_key()
                if key in KEY_BINDINGS:
                    left, right = KEY_BINDINGS[key]
                    twist.linear.x = (left + right) / 2
                    twist.angular.z = (right - left) / 2
                self.publisher.publish(twist)
                if key == 'q':
                    break
        except Exception as e:
            self.get_logger().error(str(e))

def main(args=None):
    rclpy.init(args=args)
    node = WamvKeyboardControl()
    node.control_loop()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
