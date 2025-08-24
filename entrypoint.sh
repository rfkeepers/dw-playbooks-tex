#!/usr/bin/env bash
set -euo pipefail

# DW Playbook PDF Generator - Docker Entrypoint
# Usage: docker run --rm -v "$(pwd):/tex" image:tag <dw version> <mode> <input.tex> <output.pdf>
# - dw version: 1 or 2
# - mode: l or d (for light or dark mode)
# - input.tex: source tex file
# - output.pdf: output PDF file

# Check if correct number of arguments provided
if [ $# -ne 4 ]; then
  echo "❌ Error: Invalid number of arguments"
  echo "Usage: docker run --rm -v \"\$(pwd):/tex\" IMAGE <version> <mode> <input.tex> <output.pdf>"
  echo "  version: 1 or 2 (for DW 1 or DW 2)"
  echo "  mode: l or d (for light or dark mode)"
  echo "  input.tex: source tex file"
  echo "  output.pdf: output PDF file"
  exit 1
fi

version="$1"
mode="$2"
texfile="$3"
output_pdf="$4"

# Validate parameters
if [[ "$version" != "1" && "$version" != "2" ]]; then
  echo "❌ Error: Version must be '1' or '2', got '$version'"
  exit 1
fi

if [[ "$mode" != "l" && "$mode" != "d" ]]; then
  echo "❌ Error: Mode must be 'l' (light) or 'd' (dark), got '$mode'"
  exit 1
fi

if [ ! -f "$texfile" ]; then
  echo "❌ Error: File '$texfile' not found"
  exit 1
fi

# Set variables based on parameters
class_name="dw${version}_playbook"
mode_text=$([ "$mode" = "l" ] && echo "light" || echo "dark")

echo "Building DW${version} PDF from $texfile -> $output_pdf ($mode_text mode)..."

echo "Ensuring tex file uses $class_name class..."
if ! grep -q "\\\\documentclass.*$class_name" "$texfile"; then
  echo "⚠️  Warning: $texfile should use \\\\documentclass{$class_name}"
fi

# Generate PDF
if [ "$mode" = "d" ]; then
  echo "Running pdflatex with dark mode..."
  pdflatex -interaction=nonstopmode -file-line-error "\\def\\DARKMODE{1} \\input{$texfile}" 2>&1
else
  echo "Running pdflatex..."
  pdflatex -interaction=nonstopmode -file-line-error "$texfile" 2>&1
fi

# Move the generated PDF to the target location
basename="$(basename "$texfile" .tex)"
if [ -f "$basename.pdf" ]; then
  mv "$basename.pdf" "$output_pdf"
  echo "✅ Successfully created $output_pdf ($mode_text mode)"
else
  echo "❌ Failed to create PDF"
  exit 1
fi

# Clean auxiliary files
rm -f *.aux *.log *.out *.fls *.fdb_latexmk *.toc *.nav *.snm
