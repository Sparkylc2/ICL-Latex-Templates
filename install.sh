#!/bin/bash


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


TEXMFHOME=$(kpsewhich -var-value TEXMFHOME)
INSTALL_DIR="$TEXMFHOME/tex/latex/local"

echo "installing LaTeX config..."
echo "script directory: $SCRIPT_DIR"
echo "installing to: $INSTALL_DIR"


mkdir -p "$INSTALL_DIR"

echo -e "\nlinking config files:"
for file in "$SCRIPT_DIR"/config/*.{cls,sty}; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        ln -sf "$file" "$INSTALL_DIR/$filename"
        echo "  ✓ Linked $filename"
    fi
done

echo -e "\ntesting installation:"
for file in "$SCRIPT_DIR"/config/*.cls; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        if kpsewhich "$filename" > /dev/null 2>&1; then
            echo "  ✓ $filename found by LaTeX"
        else
            echo "  ✗ $filename not found - check installation"
        fi
    fi
done

echo -e "\ninstallation complete!"
echo "you can now use the templates with the Neovim command :LatexNew"
