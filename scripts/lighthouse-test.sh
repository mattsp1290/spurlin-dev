#!/bin/bash

echo "🚀 Running Lighthouse Performance Audits"
echo "======================================"
echo ""

# Base URL
BASE_URL="http://localhost:1314"

# Create results directory
mkdir -p docs/test-results/lighthouse
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Pages to test
PAGES=(
    "/"
    "/about/"
    "/styleguide/"
    "/404.html"
    "/tags/"
    "/categories/"
)

# Check if lighthouse is installed
if ! command -v lighthouse &> /dev/null; then
    echo "❌ Lighthouse is not installed."
    echo "Please install it with: npm install -g lighthouse"
    exit 1
fi

# Run Lighthouse on each page
for PAGE in "${PAGES[@]}"; do
    URL="${BASE_URL}${PAGE}"
    FILENAME=$(echo "$PAGE" | sed 's/\//-/g' | sed 's/^-//' | sed 's/-$//')
    [ -z "$FILENAME" ] && FILENAME="home"
    
    echo "🔍 Testing ${PAGE}..."
    
    # Run Lighthouse with all categories
    lighthouse "$URL" \
        --output=html,json \
        --output-path="docs/test-results/lighthouse/${FILENAME}-${TIMESTAMP}" \
        --only-categories=performance,accessibility,best-practices,seo \
        --quiet \
        --chrome-flags="--headless"
    
    # Extract scores from JSON
    if [ -f "docs/test-results/lighthouse/${FILENAME}-${TIMESTAMP}.report.json" ]; then
        PERF_SCORE=$(jq '.categories.performance.score * 100' "docs/test-results/lighthouse/${FILENAME}-${TIMESTAMP}.report.json")
        A11Y_SCORE=$(jq '.categories.accessibility.score * 100' "docs/test-results/lighthouse/${FILENAME}-${TIMESTAMP}.report.json")
        BP_SCORE=$(jq '.categories["best-practices"].score * 100' "docs/test-results/lighthouse/${FILENAME}-${TIMESTAMP}.report.json")
        SEO_SCORE=$(jq '.categories.seo.score * 100' "docs/test-results/lighthouse/${FILENAME}-${TIMESTAMP}.report.json")
        
        echo "  Performance: ${PERF_SCORE}%"
        echo "  Accessibility: ${A11Y_SCORE}%"
        echo "  Best Practices: ${BP_SCORE}%"
        echo "  SEO: ${SEO_SCORE}%"
        echo ""
    fi
done

# Create summary report
SUMMARY_FILE="docs/test-results/lighthouse/summary-${TIMESTAMP}.md"
cat > "$SUMMARY_FILE" << 'EOF'
# Lighthouse Audit Summary

## Test Information
- **Date**: $(date)
- **Base URL**: http://localhost:1314

## Results Summary

| Page | Performance | Accessibility | Best Practices | SEO |
|------|-------------|---------------|----------------|-----|
EOF

# Add results to summary
for PAGE in "${PAGES[@]}"; do
    FILENAME=$(echo "$PAGE" | sed 's/\//-/g' | sed 's/^-//' | sed 's/-$//')
    [ -z "$FILENAME" ] && FILENAME="home"
    
    if [ -f "docs/test-results/lighthouse/${FILENAME}-${TIMESTAMP}.report.json" ]; then
        PERF=$(jq -r '.categories.performance.score * 100 | floor' "docs/test-results/lighthouse/${FILENAME}-${TIMESTAMP}.report.json")
        A11Y=$(jq -r '.categories.accessibility.score * 100 | floor' "docs/test-results/lighthouse/${FILENAME}-${TIMESTAMP}.report.json")
        BP=$(jq -r '.categories["best-practices"].score * 100 | floor' "docs/test-results/lighthouse/${FILENAME}-${TIMESTAMP}.report.json")
        SEO=$(jq -r '.categories.seo.score * 100 | floor' "docs/test-results/lighthouse/${FILENAME}-${TIMESTAMP}.report.json")
        
        # Add emoji based on score
        PERF_EMOJI=$([[ $PERF -ge 90 ]] && echo "✅" || ([[ $PERF -ge 50 ]] && echo "⚠️" || echo "❌"))
        A11Y_EMOJI=$([[ $A11Y -ge 90 ]] && echo "✅" || ([[ $A11Y -ge 50 ]] && echo "⚠️" || echo "❌"))
        BP_EMOJI=$([[ $BP -ge 90 ]] && echo "✅" || ([[ $BP -ge 50 ]] && echo "⚠️" || echo "❌"))
        SEO_EMOJI=$([[ $SEO -ge 90 ]] && echo "✅" || ([[ $SEO -ge 50 ]] && echo "⚠️" || echo "❌"))
        
        echo "| ${PAGE} | ${PERF_EMOJI} ${PERF}% | ${A11Y_EMOJI} ${A11Y}% | ${BP_EMOJI} ${BP}% | ${SEO_EMOJI} ${SEO}% |" >> "$SUMMARY_FILE"
    fi
done

echo "" >> "$SUMMARY_FILE"
echo "## Legend" >> "$SUMMARY_FILE"
echo "- ✅ Good (90-100)" >> "$SUMMARY_FILE"
echo "- ⚠️ Needs Improvement (50-89)" >> "$SUMMARY_FILE"
echo "- ❌ Poor (0-49)" >> "$SUMMARY_FILE"

echo ""
echo "==============================================="
echo "📊 Lighthouse audit complete!"
echo "📋 Summary saved to: $SUMMARY_FILE"
echo "📁 Full reports in: docs/test-results/lighthouse/"
echo "===============================================" 