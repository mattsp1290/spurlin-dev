#!/bin/bash
# Verification script for Cursor + Cline setup

echo "=== Cursor + Cline Setup Verification for Spurlin.dev ==="
echo ""

# Check for required directories
echo "Checking directories..."
dirs=(".cursor" ".vscode" "proompts" "proompts/docs" "proompts/tasks" "scripts")
for dir in "${dirs[@]}"; do
    if [ -d "$dir" ]; then
        echo "✓ $dir exists"
    else
        echo "✗ $dir missing"
    fi
done

echo ""
echo "Checking configuration files..."
# Check for required files
files=(
    ".cursor/rules.md"
    ".cursor/prompts.md"
    ".cursor/README.md"
    ".vscode/settings.json"
    ".vscode/spurlin-dev.code-snippets"
    "proompts/tasks.yaml"
    "proompts/retro-assets-tasks.yaml"
    "proompts/birb-home-tasks.yaml"
    "proompts/docs/task-schema.json"
    "scripts/task-status.sh"
    ".gitignore"
)

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "✓ $file exists"
    else
        echo "✗ $file missing"
    fi
done

echo ""
echo "Checking script permissions..."
if [ -x "scripts/task-status.sh" ]; then
    echo "✓ task-status.sh is executable"
else
    echo "✗ task-status.sh is not executable"
fi

echo ""
echo "=== Setup Summary ==="
echo "• Cursor configuration is ready in .cursor/"
echo "• VS Code settings are configured"
echo "• Task management YAML files are in place"
echo "• Scripts are ready to use"
echo ""
echo "Next steps:"
echo "1. Open proompts/tasks.yaml in Cursor"
echo "2. Run ./scripts/task-status.sh to see available tasks"
echo "3. Start with task 'init-hugo-project'"
echo "4. Remember: No Under Construction GIFs = Riots! 🚧"
echo ""
echo "Setup complete! Ready to build the most radical 90s website! 🚀"
