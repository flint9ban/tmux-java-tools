#!/usr/bin/env zsh
# ================================================
# tmux-java-tools
# 为 Java 开发者准备的 tmux 快捷工具集
# ================================================

CURRENT_DIR="${0:A:h}"

# 加载共用函数
source "$CURRENT_DIR/scripts/utils.sh"

# 主快捷键：prefix + J → 打开 Java/Maven 工具菜单
tmux bind-key J run-shell "\"$CURRENT_DIR/scripts/maven-menu.sh\""

# 可选：其他快捷键（根据需要打开或注释）
# tmux bind-key M-g run-shell "\"$CURRENT_DIR/scripts/gradle-menu.sh\""     # Gradle 菜单
# tmux bind-key M-j display-message "JDK 切换功能开发中..."                 # 占位

# 可选：状态栏显示当前 java 版本（非常粗糙示例）
# tmux set-option -g status-right "#[fg=green]Java:#(java -version 2>&1 | head -1 | cut -d '\"' -f 2) #[fg=default]%H:%M"