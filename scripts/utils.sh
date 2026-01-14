#!/usr/bin/env  zsh

# 判断当前目录是否 Maven 项目
is_maven_project() {
  [[ -f "pom.xml" ]] && return 0
  return 1
}

# 判断是否 Gradle 项目（未来扩展用）
is_gradle_project() {
  [[ -f "build.gradle" ]] || [[ -f "build.gradle.kts" ]] && return 0
  return 1
}

# 可选：获取当前 java 版本（用于状态栏或其他地方）
get_java_version() {
  java -version 2>&1 | head -1 | cut -d '"' -f 2 || echo "unknown"
}