#!/bin/bash

echo "🧪 Running TIC-80 Site Tests"
echo "============================"
echo ""

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Base URL
BASE_URL="http://localhost:1314"

# Create test results directory
mkdir -p docs/test-results
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
REPORT_FILE="docs/test-results/test-report-${TIMESTAMP}.md"

# Start report
cat > "$REPORT_FILE" << 'EOF'
# TIC-80 Design System Test Results

## Test Run Information
- **Date**: $(date)
- **Hugo Server**: http://localhost:1314
- **Test Categories**: Validation, Accessibility, Performance, Cross-Browser

## Test Results Summary

EOF

echo "📋 Phase 1: HTML Validation"
echo "=========================="

# Pages to test
PAGES=(
    "/"
    "/about/"
    "/styleguide/"
    "/404.html"
    "/tags/"
    "/categories/"
)

# HTML Validation using W3C validator
echo "" >> "$REPORT_FILE"
echo "### HTML Validation Results" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

for PAGE in "${PAGES[@]}"; do
    echo -n "Testing ${PAGE}... "
    URL="${BASE_URL}${PAGE}"
    
    # Use curl to fetch the page and validate
    VALIDATION_URL="https://validator.w3.org/nu/?out=json"
    RESPONSE=$(curl -s -H "Content-Type: text/html; charset=utf-8" --data-binary @- "$VALIDATION_URL" < <(curl -s "$URL"))
    
    # Check for errors
    ERROR_COUNT=$(echo "$RESPONSE" | jq '[.messages[] | select(.type=="error")] | length' 2>/dev/null || echo "0")
    WARNING_COUNT=$(echo "$RESPONSE" | jq '[.messages[] | select(.type=="info")] | length' 2>/dev/null || echo "0")
    
    if [ "$ERROR_COUNT" = "0" ]; then
        echo -e "${GREEN}✓ PASS${NC} (No errors)"
        echo "- ✅ ${PAGE}: **PASS** (No errors)" >> "$REPORT_FILE"
    else
        echo -e "${RED}✗ FAIL${NC} ($ERROR_COUNT errors, $WARNING_COUNT warnings)"
        echo "- ❌ ${PAGE}: **FAIL** ($ERROR_COUNT errors, $WARNING_COUNT warnings)" >> "$REPORT_FILE"
        
        # Save detailed errors
        echo "$RESPONSE" | jq '.messages[]' >> "docs/test-results/html-errors-${PAGE//\//-}.json" 2>/dev/null
    fi
done

echo ""
echo "📋 Phase 2: CSS Validation"
echo "========================"

# CSS files to test
echo "" >> "$REPORT_FILE"
echo "### CSS Validation Results" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

CSS_FILES=(
    "/css/main.css"
)

for CSS in "${CSS_FILES[@]}"; do
    echo -n "Testing ${CSS}... "
    URL="${BASE_URL}${CSS}"
    
    # Validate CSS
    VALIDATION_URL="https://jigsaw.w3.org/css-validator/validator"
    RESPONSE=$(curl -s "${VALIDATION_URL}?uri=${URL}&profile=css3svg&output=json")
    
    ERROR_COUNT=$(echo "$RESPONSE" | jq '.cssvalidation.errors | length' 2>/dev/null || echo "0")
    WARNING_COUNT=$(echo "$RESPONSE" | jq '.cssvalidation.warnings | length' 2>/dev/null || echo "0")
    
    if [ "$ERROR_COUNT" = "0" ]; then
        echo -e "${GREEN}✓ PASS${NC} ($WARNING_COUNT warnings)"
        echo "- ✅ ${CSS}: **PASS** ($WARNING_COUNT warnings)" >> "$REPORT_FILE"
    else
        echo -e "${RED}✗ FAIL${NC} ($ERROR_COUNT errors, $WARNING_COUNT warnings)"
        echo "- ❌ ${CSS}: **FAIL** ($ERROR_COUNT errors, $WARNING_COUNT warnings)" >> "$REPORT_FILE"
    fi
done

echo ""
echo "♿ Phase 3: Accessibility Testing"
echo "================================"

echo "" >> "$REPORT_FILE"
echo "### Accessibility Testing (WAVE API)" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Note: This requires WAVE API key or manual testing
echo "Note: Automated accessibility testing requires additional setup."
echo "Please use the WAVE browser extension or axe DevTools for manual testing."
echo "" >> "$REPORT_FILE"
echo "⚠️ Manual accessibility testing required using:" >> "$REPORT_FILE"
echo "- WAVE browser extension" >> "$REPORT_FILE"
echo "- axe DevTools" >> "$REPORT_FILE"
echo "- Lighthouse accessibility audit" >> "$REPORT_FILE"

echo ""
echo "🚀 Phase 4: Performance Testing"
echo "=============================="

echo "" >> "$REPORT_FILE"
echo "### Performance Metrics" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Test page load times
for PAGE in "${PAGES[@]}"; do
    echo -n "Testing load time for ${PAGE}... "
    URL="${BASE_URL}${PAGE}"
    
    # Measure load time
    LOAD_TIME=$(curl -o /dev/null -s -w '%{time_total}' "$URL")
    
    if (( $(echo "$LOAD_TIME < 1.0" | bc -l) )); then
        echo -e "${GREEN}✓ FAST${NC} (${LOAD_TIME}s)"
        echo "- ✅ ${PAGE}: **${LOAD_TIME}s** (Target: <1s)" >> "$REPORT_FILE"
    else
        echo -e "${YELLOW}⚠ SLOW${NC} (${LOAD_TIME}s)"
        echo "- ⚠️ ${PAGE}: **${LOAD_TIME}s** (Target: <1s)" >> "$REPORT_FILE"
    fi
done

echo ""
echo "📊 Phase 5: Asset Analysis"
echo "========================="

echo "" >> "$REPORT_FILE"
echo "### Asset Size Analysis" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Check CSS file size
CSS_SIZE=$(curl -s -o /dev/null -w '%{size_download}' "${BASE_URL}/css/main.css")
CSS_SIZE_KB=$((CSS_SIZE / 1024))

echo "CSS Bundle Size: ${CSS_SIZE_KB}KB"
if [ "$CSS_SIZE_KB" -lt 50 ]; then
    echo "- ✅ CSS Bundle: **${CSS_SIZE_KB}KB** (Target: <50KB)" >> "$REPORT_FILE"
else
    echo "- ⚠️ CSS Bundle: **${CSS_SIZE_KB}KB** (Target: <50KB)" >> "$REPORT_FILE"
fi

echo ""
echo "🔗 Phase 6: Link Validation"
echo "=========================="

echo "" >> "$REPORT_FILE"
echo "### Link Validation" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Check for 404s
echo "Checking for broken links..."
BROKEN_LINKS=0
for PAGE in "${PAGES[@]}"; do
    LINKS=$(curl -s "${BASE_URL}${PAGE}" | grep -oE 'href="[^"]*"' | sed 's/href="//;s/"$//' | grep -v '^#' | grep -v '^mailto:' | grep -v '^http')
    
    for LINK in $LINKS; do
        if [[ $LINK == /* ]]; then
            TEST_URL="${BASE_URL}${LINK}"
        else
            TEST_URL="${BASE_URL}${PAGE}${LINK}"
        fi
        
        STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$TEST_URL")
        if [ "$STATUS" != "200" ] && [ "$STATUS" != "301" ] && [ "$STATUS" != "302" ]; then
            echo "❌ Broken link on ${PAGE}: ${LINK} (Status: ${STATUS})"
            echo "- ❌ Broken link on ${PAGE}: ${LINK} (Status: ${STATUS})" >> "$REPORT_FILE"
            ((BROKEN_LINKS++))
        fi
    done
done

if [ "$BROKEN_LINKS" -eq 0 ]; then
    echo -e "${GREEN}✓ All links valid${NC}"
    echo "- ✅ All internal links are valid" >> "$REPORT_FILE"
fi

echo ""
echo "==============================================="
echo "📋 Test Report saved to: $REPORT_FILE"
echo "==============================================="

# Summary
echo ""
echo "Test Summary:"
echo "============="
cat "$REPORT_FILE" | grep -E "✅|❌|⚠️" | wc -l | xargs echo "Total tests run:"
cat "$REPORT_FILE" | grep "✅" | wc -l | xargs echo "Passed:"
cat "$REPORT_FILE" | grep "❌" | wc -l | xargs echo "Failed:"
cat "$REPORT_FILE" | grep "⚠️" | wc -l | xargs echo "Warnings:" 