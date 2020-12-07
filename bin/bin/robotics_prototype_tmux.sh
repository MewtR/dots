#!/bin/zsh
#
#Figure out how to start tmux session if not already in one
#if [[ -z "$TMUX" ]]; then
#    tmux new -c ~/Programming/SpaceConcordia/robotics-prototype
#fi
tmux split-window -h
tmux selectp -t 2
tmux split-window -v
tmux selectp -t 1
tmux split-window -v
tmux selectp -t 1
tmux send-keys "roscore" Enter
tmux selectp -t 4
tmux send-keys "source robot/rospackages/devel/setup.zsh && roslaunch --wait rosbridge_server rosbridge_websocket.launch" Enter
tmux selectp -t 2
tmux send-keys "source ~/Documents/pyvenvs/robotics-prototype/bin/activate && python robot/basestation/app.py" Enter
tmux selectp -t 3
tmux send-keys "source ~/Documents/pyvenvs/robotics-prototype/bin/activate && source robot/rospackages/devel/setup.zsh && roslaunch --wait robot/util/rosRoverStart/local_rover.launch" Enter
