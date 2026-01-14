#!/usr/bin/env zsh
# 共用工具函数

is_maven_project() {
    [[ -f pom.xml ]] && return 0
    return 1
}

is_gradle_project() {
    [[ -f build.gradle || -f build.gradle.kts ]] && return 0
    return 1
}

get_java_version() {
    java -version 2>&1 | head -1 | cut -d '"' -f 2 2>/dev/null || echo "unknown"
}