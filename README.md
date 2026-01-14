
# tmux-java-tools

Java 开发者的 tmux 快捷工具集，主要提供 Maven 常用操作的快速弹窗菜单。

## 主要功能

- `prefix + J` → 打开 Maven 工具菜单（需要 fzf）
- 支持最常用的 Maven 刷新/构建/依赖查看等操作
- 支持自定义命令输入
- 自动检测当前目录是否 Maven 项目

## 安装

使用 **[Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)**（推荐）：

在 `~/.tmux.conf` 最后加入：

```tmux
set -g @plugin '你的GitHub用户名/tmux-java-tools'