# AI Control Room with VLLM



# 1. 개요
- 해양드론의 카메라 영상을 ChatGPT로 분석하고 어떤 행동을 취할지 Action을 도출해 해양드론 자율제어
  - Visual-LLM : 사진을 인식하고 그에 대한 질문에 응답을 생성하는 언어모델 (ChatGPT 4.0이상 기본 탑재)
  - 대상 수상드론 : 수상드론 WAM-V(자료 많음)에 카메라를 설치해 Gazebo에서 구현
  - 대상 환경 : 전방에 색이 다른 3개의 부유꼬깔콘
  - 목표 명령 : 어느 꼬깔콘 사이를 지나갈지를 명령하면 그에 따라 이동

# 2. 구현환경 설치 및 설정

## 2.1 ROS-Gazebo 설치

- 환경 : 맥북 네이티브 (VMWare X)

### 2.1.0 ZSH SHELL 설치와 설정

- `zsh` 설치
    
  ```bash
  brew install zsh
  ```

  - 설치 확인
  
    ```bash
    which zsh
    ```

    `/opt/homebrew/bin/zsh` 가 나오면 정상 설치

- `zsh` 기본 쉘로 변경
    
  ```bash
  chsh -s /opt/homebrew/bin/zsh
  ```

  - 터미널은 재시작하면 변경된 zsh 쉘로 실행됨

- `zsh` 테마를 `agnoster`로 변경
  
  - `oh-my-zsh` 설치
    
    ```bash
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

  - `~/.zshrc` 파일을 nano 메모장으로 열기
    
    ```bash
    nano ~/.zshrc
    ```
      
  - `ZSH_THEME="agnoster"` 로 변경 후 저장하고 종료
  - 터미널을 재시작하면 변경된 테마가 적용됨
  
  - Powerline폰트 설치 및 적용

    ```bash
    brew install romkatv/powerlevel10k/powerlevel10k
    # 아래 명령어를 입력하면 이것저것 폰트가 잘 보이는지, 디자인은 어떻게 할건지 물어봄 질문에 따라 선택
    source /opt/homebrew/opt/powerlevel10k/share/powerlevel10k/powerlevel10k.zsh-theme
    ```

- 유용한 플러그인 설치
  - `zsh-syntax-highlighting, zsh-autosuggestions` 설치
    
    ```bash
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```
      
  - `~/.zshrc` 파일을 nano 메모장으로 열기
    
    ```bash
    nano ~/.zshrc
    ```
      
  - 내용 중 `plugins=(...)` 부분에 `zsh-syntax-highlighting, zsh-autosuggestions` 추가 후 저장하고 종료
    ```bash
    plugins=(direnv git colored-man-pages colorize pip python brew macos jsontools history sudo zsh-autosuggestions zsh-syntax-highlighting)
    ```

### 2.1.1 ROS-Gazebo 설치
> 참고자료 : https://github.com/IOES-Lab/ROS_GZ_MacOS_Native_AppleSilicon/tree/macos_patch
- ROS는 소스코드로부터 직접 컴파일, Gazebo는 brew 패키지 매니저로 컴파일된 binary 설치
- 설치명령어
    
  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/IOES-Lab/ROS2_Jazzy_MacOS_Native_AppleSilicon/main/install.sh)"
  ```
    
- 설치 후 설치환경 로딩하려면,
    
  ```bash
  source ~/ros2_jazzy/activate_ros
  ```
  
  - 매번 새로운 Terminal 창을 켤때마다 실행시켜야 함, 단축어로 만들어서 저장해두면 편함
    - `nano ~/.zprofile` 로 매번 터미널을 켤때마다 실행되는 파일 `.zprofile` 을 nano 메모장어플로 실행
    - 아래 내용을 맨 아래 추가
        
      ```bash
      # Activate ROS-Gazebo
      alias ros='source ~/ros2_jazzy/activate_ros'
      ```
        
    - `Ctrl-X` , `Y` 로 수정사항 저장
    - 현재 터미널을 종료하고 새로운 터미널 실행
    - `ros` 만 입력하면 자동으로 `source ~/ros2_jazzy/activate_ros` 실행됨 (매 터미널을 켤때마다 `ros` 입력 필요)

### 2.1.2 ROS_GZ 설치
> 참고자료 : https://github.com/IOES-Lab/ROS_GZ_MacOS_Native_AppleSilicon/tree/macos_patch
- SIP 비활성화
  - 맥북을 재시작하고 켜질때 파워버튼을 오래 누르기
  - 선택 창에서 `Options` 를 선택해 recovery mode로 부팅
  - Use `Utilities` -> `Terminal` 으로 터미널 창을 열고 아래 명령어를 입력
    
    ```bash
    csrutil disable
    ```
        
- `ROS_GZ`(맥 패치버전) 설치
  - 필요 소스코드 다운로드
      
    ```bash
    mkdir -p $HOME/ros_gz_ws/src
    cd $HOME/ros_gz_ws/src
    git clone https://github.com/IOES-Lab/ROS_GZ_MacOS_Native_AppleSilicon.git
    git clone https://github.com/swri-robotics/gps_umd.git
    git clone https://github.com/rudislabs/actuator_msgs.git
    git clone https://github.com/ros-perception/vision_msgs.git
    cd $HOME/ros_gz_ws

    # GPSD 설치
    brew install gpsd
    ```
      
  - Set environment variables
      
    ```bash
    export CMAKE_PREFIX_PATH=$(brew --prefix qt@5)/lib:$(brew --prefix qt@5)/lib/cmake:/opt/homebrew/opt:${CMAKE_PREFIX_PATH}
    export PATH=$(brew --prefix qt@5)/bin:$PATH
    # This is rough.. but works
    ln -s $(brew --prefix qt@5)/mkspecs /opt/homebrew/mkspecs
    ln -s $(brew --prefix qt@5)/plugins /opt/homebrew/plugins
    ```
      
  - `gz-msgs10` cmake 파일에서 `TINYXML2:TINYXML2` 수정
    - `/opt/homebrew/opt/gz-msgs10/lib/cmake/gz-msgs10/gz-msgs10-targets.cmake` 파일을 nano 메모장으로 열기
    
    ```bash
    sudo nano /opt/homebrew/opt/gz-msgs10/lib/cmake/gz-msgs10/gz-msgs10-targets.cmake
    ```
      
    - 파일 내용 중 `TINYXML2:TINYXML2` 를 찾아 `tinyxml2::tinyxml2` 로 수정
      - 찾는건 `Ctrl-W`, 찾는 문자열, 엔터로 다음으로 넘어가기
      - 수정후 `Ctrl-X` , `Y` 로 수정사항 저장
  
  - `ROS_GZ` 컴파일
      
    ```bash
    source $HOME/ros2_jazzy/activate_ros
    
    python3.11 -m colcon build --symlink-install \
        --packages-skip-by-dep python_qt_binding \
        --cmake-args \
        -DBUILD_TESTING=OFF \
        -DCMAKE_OSX_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk \
        -Wno-dev --event-handlers console_cohesion+
    ```
        
- `ROS_GZ` 환경설정 스크립트 설정
  - `ROS_GZ` 환경설정 스크립트를 `$HOME/ros2_jazzy/activate_ros` 에 추가
  - 자동으로 맨 아래줄에 추가하는 명령어
      
    ```bash
    echo "" >> $HOME/ros2_jazzy/activate_ros
    echo "# Activate ros_gz" >> $HOME/ros2_jazzy/activate_ros
    echo "source $HOME/ros_gz_ws/install/setup.zsh" >> $HOME/ros2_jazzy/activate_ros
    ```

- 원상복귀!
  - `gz-msgs10` cmake 파일에서 `tinyxml2:tinyxml2` 수정
    - `/opt/homebrew/opt/gz-msgs10/lib/cmake/gz-msgs10/gz-msgs10-targets.cmake` 파일을 nano 메모장으로 열기
    
    ```bash
    sudo nano /opt/homebrew/opt/gz-msgs10/lib/cmake/gz-msgs10/gz-msgs10-targets.cmake
    ```
      
    - 파일 내용 중 `tinyxml2:tinyxml2` 를 찾아 `TINYXML2::TINYXML2` 로 수정
      - 찾는건 `Ctrl-W`, 찾는 문자열, 엔터로 다음으로 넘어가기
      - 수정후 `Ctrl-X` , `Y` 로 수정사항 저장

  - SIP 재활성화 (옵션, 권장)
    - 맥북을 재시작하고 켜질때 파워버튼을 오래 누르기
    - 선택 창에서 `Options` 를 선택해 recovery mode로 부팅
    - Use `Utilities` -> `Terminal` 으로 터미널 창을 열고 아래 명령어를 입력
        
      ```bash
      csrutil enable
      ```
            

## 2.2 `AI-Control-Room-VLLM` 설치

- 깃허브 설정
  - SSH키 발급 : https://docs.github.com/ko/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=mac
  - SSH키 등록 : https://docs.github.com/ko/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

- `AI-Control-Room-VLLM` 소스코드 다운로드

  ```bash
  mkdir -p $HOME/vllm_control_ws/src
  cd $HOME/vllm_control_ws/src
  git clone git@github.com:IOES-Lab/AI-Control-Room-VLLM.git
  ```

- 필요 라이브러리 설치
  - 패키지 매니저 `homebrew` 설치
  
    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

  - `cgal`, `fftw` 설치
  
    ```bash
    brew update
    brew install cgal fftw gz-math7
    ```

- 컴파일
  ```bash
  cd $HOME/vllm_control_ws

  mv $HOME/ros2_jazzy/install/gz_math_vendor/opt/gz_math_vendor/include/gz/math7/gz $HOME/ros2_jazzy/install/gz_math_vendor/opt/gz_math_vendor/include/gz/math7/gz_old
  ln -s /opt/homebrew/opt/gz-math7/include/gz/math7/gz $HOME/ros2_jazzy/install/gz_math_vendor/opt/gz_math_vendor/include/gz/math7/gz

  colcon build --symlink-install --merge-install --cmake-args \
      -DCMAKE_BUILD_TYPE=RelWithDebInfo \
      -DBUILD_TESTING=ON \
      -DCMAKE_CXX_STANDARD=17 \
      -DCMAKE_MACOSX_RPATH=FALSE \
      -DCMAKE_CXX_FLAGS=-Wno-duplicate-libraries \
      -DCMAKE_INSTALL_NAME_DIR=$(pwd)/install/lib \
      -DCMAKE_INCLUDE_PATH=$HOME/ros2_jazzy/install/gz_math_vendor/opt/gz_math_vendor/include/gz/math7/gz/math
  ```

- `AI-Control-Room-VLLM` 환경설정 스크립트 설정
  - `AI-Control-Room-VLLM` 환경설정 스크립트를 `$HOME/ros2_jazzy/activate_ros` 에 추가
  - 자동으로 맨 아래줄에 추가하는 명령어
      
    ```bash
    echo "" >> $HOME/ros2_jazzy/activate_ros
    echo "# ---- Activate AI-Control-Room-VLLM ----- " >> $HOME/ros2_jazzy/activate_ros
    echo "source $HOME/vllm_control_ws/install/setup.zsh" >> $HOME/ros2_jazzy/activate_ros
    ```

  - 모델, 플러그인 파일들 위치 환경변수 설정
    - `nano $HOME/ros2_jazzy/activate_ros` 로 열어서 맨 아래에 아래 내용 추가
      
      ```bash
      # FOR MODEL AND PLUGIN FILES 
      # not usually required as should default to localhost address
      export GZ_IP=127.0.0.1

      # ensure the model and world files are found
      export GZ_SIM_RESOURCE_PATH=\
      $GZ_SIM_RESOURCE_PATH:\
      $HOME/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves-models/models:\
      $HOME/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves-models/world_models:\
      $HOME/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves-models/worlds

      # ensure the system plugins are found
      export GZ_SIM_SYSTEM_PLUGIN_PATH=\
      $GZ_SIM_SYSTEM_PLUGIN_PATH:\
      $HOME/vllm_control_ws/install/lib

      # ensure the gui plugin is found
      export GZ_GUI_PLUGIN_PATH=\
      $GZ_GUI_PLUGIN_PATH:\
      $HOME/vllm_control_ws/src/AI-Control-Room-VLLM/gz-waves/src/gui/plugins/waves_control/build
      ```


## 2.3 `AI-Control-Room-VLLM` 실행 테스트

### 2.3.1 기본 실행 테스트 : 파도 위의 모델들
    
```bash
# 환경변수 로드 (source ~/ros2_jazzy/activate_ros의 단축어)
ros
# waves.sdf 실행
ros2 launch ros_gz_ai_control ai_control.launch.py world:=waves robot:=wamv
```

- 종료하려면 창에 `Ctrl-C` 입력
- `waves` world 외에 `waves_high`도 있음

- 추력 제어 테스트
  - 100으로 왼쪽 엔진에 Thrust 발생 (10Hz 주기로 지속적으로 전송)
   
  ```bash 
  ros2 topic pub /model/wamv/joint/left_propeller_joint/cmd_thrust std_msgs/msg/Float64 '{data: 100.0}' -r 10
  ```

### 참고사항
- 원래 WAM-V는 엔진이 돌아가나 그러면 문제가 너무 어려워지므로 여기서는 engine-joint를 fixed로 고정시켜 놓음
  - 왼쪽 오른쪽 추력 조절로면 방향조절 시도
  - 필요하다면 `wamv.sdf` 파일을 수정해서 `Joint state and force plugins`을 사용하고 `right_engine_joint`를 fixed에서 revolute로 수정 후 사용

### 앞으로 해야 할 것 (제안, 물론 맘대로 다르게 진행해도 됩니다)
- wamv에 카메라 달기
  - 카메라 가제보 메시지 토픽을 ROS로 변환하는 것 만들어야함
  - `gz-waves-models>models>wamv>config>robot_config.py` 파일에 카메라 이미지 메시지 추가
  - `rviz2`로 카메라 이미지 확인
- 컨트롤 파이썬 노드 만들기
- 카메라의 이미지를 컨트롤 파이썬 노드에서 받아오기
- LLM으로 전달해서 사진에 대한 설명 받아보기
- LLM으로 추력 명령어 보내보기
- 모든걸 연결하기
- wave_high와 비교해서 난이도 올라갔을때 성능 비교하기


