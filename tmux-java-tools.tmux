#!/usr/bin/env zsh
# tmux-java-tools - Java 开发者的 tmux 工具集
# https://github.com/你的用户名/tmux-java-tools

emulate -L zsh
setopt extended_glob

CURRENT_DIR=${0:A:h}

# 防止重复加载（推荐做法）
if [[ "$(tmux show -gv @tmux-java-tools-loaded 2>/dev/null)" == "on" ]]; then
    exit 0
fi
tmux set -g @tmux-java-tools-loaded on

# 主快捷键：prefix + J → Maven 菜单
tmux bind-key J run-shell "\"$CURRENT_DIR/scripts/maven-menu.zsh\""

# 可选快捷键（根据需求自行打开）
# tmux bind-key M-g run-shell "\"$CURRENT_DIR/scripts/gradle-menu.zsh\""
# tmux bind-key M-j display-message "JDK 切换功能开发中..."