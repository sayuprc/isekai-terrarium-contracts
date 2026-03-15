#!/bin/bash
FILE=$(echo "$CLAUDE_TOOL_INPUT" | jq -r '.file_path // empty')
if [[ "$FILE" != *.tsp ]]; then exit 0; fi

cd "$(git rev-parse --show-toplevel)"
OUTPUT=$(bun run format:fix 2>&1)
EXIT_CODE=$?

if [ $EXIT_CODE -ne 0 ]; then
  echo "{\"additionalContext\": \"フォーマットエラー: $OUTPUT\"}"
  exit 2
fi
