#! /bin/zsh

run () {
tmux split-window -h -c '#{pane_current_path}'
tmux selectp -t 2
tmux split-window -v -c '#{pane_current_path}'
tmux selectp -t 1
tmux split-window -v -c '#{pane_current_path}'
tmux selectp -t 1
tmux send-keys "roscore" Enter
tmux selectp -t 4
tmux send-keys "source robot/rospackages/devel/setup.zsh && roslaunch --wait rosbridge_server rosbridge_websocket.launch" Enter
tmux selectp -t 2
tmux send-keys "source ~/Documents/pyvenvs/robotics-prototype/bin/activate && python robot/basestation/app.py" Enter
tmux selectp -t 3
tmux send-keys "source ~/Documents/pyvenvs/robotics-prototype/bin/activate && source robot/rospackages/devel/setup.zsh && roslaunch --wait robot/util/rosRoverStart/local_rover.launch" Enter
}

if [[ -z "$TMUX" ]]; then
    tmux new -c ~/Programming/SpaceConcordia/robotics-prototype -d
    x=1
fi

if [[ "$PWD" != "~/Programming/SpaceConcordia/robotics-prototype" && -z "$x" ]]; then
    cd ~/Programming/SpaceConcordia/robotics-prototype
fi

run

if [[ -n "$x" ]]; then
    tmux -2 attach-session -d
fi
