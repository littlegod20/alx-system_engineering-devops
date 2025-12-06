#!/bin/bash
# fix_alx_scripts.sh - Fix all ALX script issues

echo "🔧 Fixing ALX bash scripts..."
echo "================================"

# Define all script contents
declare -A SCRIPTS

# 0x03-shell_variables_expansions scripts
SCRIPTS["0x03-shell_variables_expansions/0-alias"]='#!/bin/bash
alias ls="rm *"'

SCRIPTS["0x03-shell_variables_expansions/1-hello_you"]='#!/bin/bash
echo "hello $USER"'

SCRIPTS["0x03-shell_variables_expansions/2-path"]='#!/bin/bash
export PATH="$PATH:/action"'

SCRIPTS["0x03-shell_variables_expansions/3-paths"]='#!/bin/bash
echo $PATH | tr '\'':'\'' '\''\n'\'' | wc -l'

SCRIPTS["0x03-shell_variables_expansions/4-global_variables"]='#!/bin/bash
printenv'

SCRIPTS["0x03-shell_variables_expansions/5-local_variables"]='#!/bin/bash
set'

SCRIPTS["0x03-shell_variables_expansions/6-create_local_variable"]='#!/bin/bash
BEST="School"'

SCRIPTS["0x03-shell_variables_expansions/7-create_global_variable"]='#!/bin/bash
export BEST="School"'

SCRIPTS["0x03-shell_variables_expansions/8-true_knowledge"]='#!/bin/bash
echo $((128 + TRUEKNOWLEDGE))'

SCRIPTS["0x03-shell_variables_expansions/9-divide_and_rule"]='#!/bin/bash
echo $((POWER / DIVIDE))'

SCRIPTS["0x03-shell_variables_expansions/10-love_exponent_breath"]='#!/bin/bash
echo $((BREATH ** LOVE))'

SCRIPTS["0x03-shell_variables_expansions/11-binary_to_decimal"]='#!/bin/bash
echo $((2#$BINARY))'

SCRIPTS["0x03-shell_variables_expansions/12-combinations"]='#!/bin/bash
echo {a..z}{a..z} | tr '\'' '\'' '\''\n'\'' | grep -v "oo"'

SCRIPTS["0x03-shell_variables_expansions/13-print_float"]='#!/bin/bash
printf "%.2f\n" $NUM'

SCRIPTS["0x03-shell_variables_expansions/100-decimal_to_hexadecimal"]='#!/bin/bash
printf "%x\n" $DECIMAL'

SCRIPTS["0x03-shell_variables_expansions/101-rot13"]='#!/bin/bash
tr '\''A-Za-z'\'' '\''N-ZA-Mn-za-m'\'''

SCRIPTS["0x03-shell_variables_expansions/102-odd"]='#!/bin/bash
perl -lne '\''print if $. % 2 == 1'\'''

SCRIPTS["0x03-shell_variables_expansions/103-water_and_stir"]='#!/bin/bash
printf "%o\n" $(( 5#$( echo $WATER | tr '\''water'\'' '\''01234'\'') + 5#$( echo $STIR | tr '\''stir.'\'' '\''01234'\'') )) | tr '\''01234567'\'' '\''bestchol'\'''

# Process each script
total_fixed=0
total_created=0

for script_path in "${!SCRIPTS[@]}"; do
    # Get the directory and filename
    dir=$(dirname "$script_path")
    filename=$(basename "$script_path")
    
    # Create directory if it doesn't exist
    if [[ ! -d "$dir" ]]; then
        echo "📁 Creating directory: $dir"
        mkdir -p "$dir"
    fi
    
    # Check if file exists
    if [[ -f "$script_path" ]]; then
        echo "🔧 Fixing: $script_path"
        action="fixed"
        total_fixed=$((total_fixed + 1))
    else
        echo "📝 Creating: $script_path"
        action="created"
        total_created=$((total_created + 1))
    fi
    
    # Write the content with proper newline
    echo "${SCRIPTS[$script_path]}" > "$script_path"
    
    # Ensure Unix line endings
    if command -v dos2unix &> /dev/null; then
        dos2unix "$script_path" 2>/dev/null
    else
        # Fallback method to convert line endings
        sed -i 's/\r$//' "$script_path" 2>/dev/null || sed -i '' 's/\r$//' "$script_path" 2>/dev/null
    fi
    
    # Make executable
    chmod +x "$script_path"
    
    # Verify the fix
    line_count=$(wc -l < "$script_path")
    if [[ $line_count -eq 2 ]] && [[ -x "$script_path" ]]; then
        echo "  ✅ $action successfully (2 lines, executable)"
    else
        echo "  ⚠️  Warning: $script_path may still have issues"
    fi
done

echo ""
echo "================================"
echo "📊 SUMMARY"
echo "================================"
echo "Files fixed: $total_fixed"
echo "Files created: $total_created"
echo "Total processed: $((total_fixed + total_created))"
echo ""
echo "✅ Done! Run ./check_scripts.sh to verify all fixes."
echo ""
echo "💡 Next steps:"
echo "   1. Run: ./check_scripts.sh"
echo "   2. If all pass, commit and push:"
echo "      git add ."
echo "      git commit -m 'Fix script formatting and requirements'"
echo "      git push"