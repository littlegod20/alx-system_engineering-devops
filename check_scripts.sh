#!/bin/bash
# check_scripts.sh - Comprehensive ALX Script Checker

echo "🔍 Checking ALX bash scripts..."
echo "================================"

total_files=0
passed_files=0
failed_files=0

for file in $(git ls-files); do
    # Skip non-0x directories
    if [[ "$file" != 0x*/* ]]; then
        continue
    fi

    # Skip README.md files
    if [[ "$file" == *.md ]]; then
        continue
    fi

    # Skip directories
    if [[ -d "$file" ]]; then
        continue
    fi

    # Skip if file doesn't exist
    if [[ ! -f "$file" ]]; then
        continue
    fi

    total_files=$((total_files + 1))
    echo ""
    echo "📄 Checking: $file"
    
    failed=0
    issues=()

    # Check 1: Must be exactly 2 lines long
    line_count=$(wc -l < "$file")
    if [[ $line_count -ne 2 ]]; then
        issues+=("  ❌ Line count is $line_count (must be exactly 2)")
        failed=1
    else
        echo "  ✅ Line count: 2"
    fi

    # Check 2: Must end with newline
    if [[ -n $(tail -c 1 "$file") ]]; then
        issues+=("  ❌ File doesn't end with newline")
        failed=1
    else
        echo "  ✅ Ends with newline"
    fi

    # Check 3: First line must be #!/bin/bash
    first_line=$(head -n 1 "$file")
    if [[ "$first_line" != "#!/bin/bash" ]]; then
        issues+=("  ❌ First line is not '#!/bin/bash' (found: '$first_line')")
        failed=1
    else
        echo "  ✅ Shebang correct"
    fi

    # Check 4: Must be executable
    if [[ ! -x "$file" ]]; then
        issues+=("  ❌ File is not executable")
        failed=1
    else
        echo "  ✅ Executable permission set"
    fi

    # Check 5: Check for forbidden operators
    content=$(cat "$file")
    forbidden=""
    if grep -q '&&' "$file"; then
        forbidden+="'&&' "
    fi
    if grep -q '||' "$file"; then
        forbidden+="'||' "
    fi
    if grep -q ';' "$file"; then
        forbidden+="';' "
    fi
    if grep -qw 'bc' "$file"; then
        forbidden+="'bc' "
    fi
    if grep -qw 'sed' "$file"; then
        forbidden+="'sed' "
    fi
    if grep -qw 'awk' "$file"; then
        forbidden+="'awk' "
    fi
    
    if [[ -n "$forbidden" ]]; then
        issues+=("  ❌ Contains forbidden operators/commands: $forbidden")
        failed=1
    else
        echo "  ✅ No forbidden operators"
    fi

    # Check 6: Check for Windows line endings (CRLF)
    if file "$file" | grep -q CRLF; then
        issues+=("  ❌ Contains Windows line endings (CRLF)")
        failed=1
    else
        echo "  ✅ Unix line endings (LF)"
    fi

    # Check 7: Check for trailing spaces
    if grep -q '[[:space:]]$' "$file"; then
        issues+=("  ❌ Contains trailing spaces")
        failed=1
    else
        echo "  ✅ No trailing spaces"
    fi

    # Print issues if any
    if [[ $failed -eq 1 ]]; then
        echo ""
        echo "  ⚠️  ISSUES FOUND:"
        for issue in "${issues[@]}"; do
            echo "$issue"
        done
        failed_files=$((failed_files + 1))
        echo "  ❌ FAILED"
    else
        passed_files=$((passed_files + 1))
        echo "  ✅ PASSED"
    fi
done

echo ""
echo "================================"
echo "📊 SUMMARY"
echo "================================"
echo "Total files checked: $total_files"
echo "Passed: $passed_files ✅"
echo "Failed: $failed_files ❌"

if [[ $failed_files -eq 0 ]]; then
    echo ""
    echo "🎉 All scripts passed!"
    exit 0
else
    echo ""
    echo "⚠️  Some scripts need fixing. Run ./fix_alx_scripts.sh to fix them."
    exit 1
fi