#!/bin/bash
cd "$(git rev-parse --show-toplevel)"
RESULT=""

FORMAT=$(bun run format:check 2>&1)
if [ $? -ne 0 ]; then RESULT="$RESULT\nフォーマット違反あり: $FORMAT"; fi

TEST=$(bun test 2>&1)
if [ $? -ne 0 ]; then RESULT="$RESULT\nテスト失敗: $TEST"; fi

if [ -n "$RESULT" ]; then
  echo -e "$RESULT"
  exit 1
fi
