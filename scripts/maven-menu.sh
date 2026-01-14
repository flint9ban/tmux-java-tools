#!/usr/bin/env zsh
# tmux-java-tools - Maven 快速操作菜单

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/utils.sh" 2>/dev/null || true

if ! is_maven_project; then
  tmux display-message "当前目录未检测到 pom.xml，不是标准 Maven 项目"
  exit 0
fi

CHOICE=$(cat <<'EOF' | fzf --height=65% --reverse --border --prompt="Maven Tools > " \
  --header="当前路径: #{pane_current_path}    (使用箭头/模糊搜索选择，回车执行)"
1  clean install -U -e -DskipTests          # 最常用：强制刷新 + 跳过测试
2  dependency:resolve -U                    # 只更新依赖，不构建
3  clean package -U -DskipTests             # 打包（跳测试）
4  clean install -U                         # 强制全量构建
5  dependency:tree -Dverbose -Dincludes=*   # 依赖树（详细版）
6  clean                                    # 只是清理 target/
c  自定义 Maven 命令...
q  退出
EOF
)

[ -z "$CHOICE" ] && exit 0

case "$CHOICE" in
  1) cmd="clean install -U -e -DskipTests" ;;
  2) cmd="dependency:resolve -U" ;;
  3) cmd="clean package -U -DskipTests" ;;
  4) cmd="clean install -U" ;;
  5) cmd="dependency:tree -Dverbose -Dincludes=*" ;;
  6) cmd="clean" ;;
  c*)
    cmd=$(tmux command-prompt -p "输入完整 mvn 命令（默认回车使用最常用）: " "run-shell 'echo %1'")
    cmd=${cmd:-"clean install -U -e -DskipTests"}
    ;;
  q*|*) exit 0 ;;
esac

# 在 popup 中执行并显示结果
tmux display-popup -w 90% -h 80% -d "#{pane_current_path}" -E \
  "echo -e \"\033[1;32m执行命令：mvn $cmd\033[0m\"; \
   echo '══════════════════════════════════════════════════════════════'; \
   mvn $cmd 2>&1 | tee /tmp/tmux-java-tools-mvn.log; \
   echo ''; \
   echo -e \"\033[1;33m执行完成｜日志已保存至 /tmp/tmux-java-tools-mvn.log\033[0m\"; \
   echo '按任意键关闭窗口...'; read -n 1"