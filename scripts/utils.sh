#!/usr/bin/env zsh
# 共用工具函数（zsh 版）

is_maven_project() {
  [[ -f pom.xml ]] && return 0
  return 1
}

is_gradle_project() {
  [[ -f build.gradle || -f build.gradle.kts ]] && return 0
  return 1
}

# 可选：获取当前 java 版本
get_java_version() {
  java -version 2>&1 | head -1 | cut -d '"' -f 2 2>/dev/null || echo "unknown"
}