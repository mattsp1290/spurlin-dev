#!/bin/bash
# Quick task status checker for spurlin.dev project

echo "=== Spurlin.dev Task Status Summary ==="
echo ""

# Define the tasks file location
TASKS_FILE="proompts/tasks.yaml"

if [ ! -f "$TASKS_FILE" ]; then
    echo "Error: tasks.yaml not found at $TASKS_FILE"
    exit 1
fi

# Count tasks by status
echo "Task Counts:"
echo "- Completed: $(grep -c "status: completed" "$TASKS_FILE")"
echo "- In Progress: $(grep -c "status: in-progress" "$TASKS_FILE")"
echo "- Pending: $(grep -c "status: pending" "$TASKS_FILE")"
echo "- Blocked: $(grep -c "status: blocked" "$TASKS_FILE")"

echo ""
echo "=== Blocked Tasks ==="
awk '/- id:/{id=$3} /name:/{gsub(/^[[:space:]]*name:[[:space:]]*"/, "", $0); gsub(/"[[:space:]]*$/, "", $0); name=$0} /blocked_by:/{print "- " id ": " name " (blocked by: " $NF ")"}' "$TASKS_FILE"

echo ""
echo "=== In-Progress Tasks ==="
awk '/- id:/{id=$3} /name:/{gsub(/^[[:space:]]*name:[[:space:]]*"/, "", $0); gsub(/"[[:space:]]*$/, "", $0); name=$0} /status: in-progress/{print "- " id ": " name}' "$TASKS_FILE"

echo ""
echo "=== Next Available Tasks (pending with no blockers) ==="
# Show pending tasks that don't have blocked_by field
awk '
    /- id:/{id=$3; blocked=0} 
    /name:/{gsub(/^[[:space:]]*name:[[:space:]]*"/, "", $0); gsub(/"[[:space:]]*$/, "", $0); name=$0} 
    /blocked_by:/{blocked=1}
    /status: pending/{if (!blocked && id) print "- " id ": " name}
' "$TASKS_FILE" | head -10

echo ""
echo "=== Critical External Dependencies ==="
echo "- retro-web-assets: Required for theme components (Under Construction GIFs!)"
echo "- birb-home: Infrastructure and deployment pipeline"
echo "- local-otel: Observability integration"

echo ""
echo "Note: Theme development is blocked until retro-web-assets delivers!"
