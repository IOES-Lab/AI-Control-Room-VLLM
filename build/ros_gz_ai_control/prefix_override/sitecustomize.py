import sys
if sys.prefix == '/Users/kimminjung/.ros2_venv':
    sys.real_prefix = sys.prefix
    sys.prefix = sys.exec_prefix = '/Users/kimminjung/vllm_control_ws/src/AI-Control-Room-VLLM/install'
