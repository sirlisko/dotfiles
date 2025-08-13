#!/bin/bash

# Replace this with your verified editor bundle ID
CURSOR_ID="com.todesktop.230313mzl4w4u92"
VSCODE_ID="com.microsoft.VSCode"
WINDSURF_ID="com.exafunction.windsurf"

case "$1" in
  "vscode")
    EDITOR_ID=$VSCODE_ID
    EDITOR_NAME="VSCode"
    ;;
  "cursor")
    EDITOR_ID=$CURSOR_ID
    EDITOR_NAME="Cursor"
    ;;
  "windsurf")
    EDITOR_ID=$WINDSURF_ID
    EDITOR_NAME="Windsurf"
    ;;
  *)
    echo "Usage: $0 {vscode|cursor|windsurf}"
    exit 1
    ;;
esac

echo "Setting default editor to $EDITOR_NAME..."

# Array of file extensions
EXTENSIONS=(
  # Web development
  ".html" ".css" ".js" ".jsx" ".ts" ".tsx"
  ".vue" ".svelte" ".scss" ".sass" ".less"

  # Python
  ".py" ".ipynb"

  # Ruby
  ".rb" ".erb"

  # Java/Kotlin
  ".java" ".kt"

  # C/C++
  ".c" ".cpp" ".h" ".hpp"

  # Go
  ".go"

  # Rust
  ".rs"

  # PHP
  ".php" ".phtml"

  # Swift/Dart
  ".swift" ".dart"

  # Data/Database
  ".sql" ".graphql" ".gql" ".r" ".R"

  # Config files
  ".json" ".yml" ".yaml" ".toml" ".xml" ".md"
  ".txt" ".ini" ".env" ".properties" ".conf"
  ".gitignore" ".editorconfig" ".prettierrc"

  # Infrastructure
  ".hcl" ".tf" ".lua"

  # Shell scripts
  ".sh" ".bash" ".zsh"
)

# Set each file association
for ext in "${EXTENSIONS[@]}"; do
  echo "Setting $ext to open with editor..."
  duti -s "$EDITOR_ID" "$ext" all
done

echo "Done! Editor should now be set as the default for all development files."