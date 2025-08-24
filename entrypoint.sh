#!/usr/bin/env bash
set -euo pipefail

# DW Playbook PDF Generator - Docker Entrypoint
# Usage:
#   Copy template: docker run --rm -v "$(pwd):/tex" image:tag [-v|--verbose] <thing> <version> template <output.tex>
#   Generate PDF: docker run --rm -v "$(pwd):/tex" image:tag [-v|--verbose] <thing> <version> <colorscheme> <input.tex> <output.pdf>

# Parse verbose flag
VERBOSE="false"
if [[ $# -gt 0 ]] && { [[ "$1" == "-v" ]] || [[ "$1" == "--verbose" ]]; }; then
  VERBOSE="true"
  shift # Remove the verbose flag from arguments
fi

# Function to normalize thing parameter
normalize_thing() {
  case "$1" in
  "playbook" | "p") echo "playbook" ;;
  *)
    echo "❌ Error: Invalid thing '$1'. Must be 'playbook' or 'p'"
    exit 1
    ;;
  esac
}

# Function to normalize version parameter
normalize_version() {
  case "$1" in
  "dw1" | "1") echo "1" ;;
  "dw2" | "2") echo "2" ;;
  *)
    echo "❌ Error: Invalid version '$1'. Must be 'dw1', '1', 'dw2', or '2'"
    exit 1
    ;;
  esac
}

# Function to normalize colorscheme parameter
normalize_colorscheme() {
  case "$1" in
  "light" | "l") echo "l" ;;
  "dark" | "d") echo "d" ;;
  *)
    echo "❌ Error: Invalid colorscheme '$1'. Must be 'light', 'l', 'dark', or 'd'"
    exit 1
    ;;
  esac
}

# Handle template copying command: <thing> <version> template <output.tex>
if [ $# -eq 4 ] && [ "$3" = "template" ]; then
  thing=$(normalize_thing "$1")
  version=$(normalize_version "$2")
  output_file="$4"

  template_source="/usr/local/share/dw-playbook-templates/dw${version}_template.tex"

  if [ ! -f "$template_source" ]; then
    echo "❌ Error: Template file not found in container"
    exit 1
  fi

  if [ -f "$output_file" ]; then
    echo "❌ Error: File '$output_file' already exists"
    exit 1
  fi

  echo "📄 Copying DW${version} template to $output_file..."
  cp "$template_source" "$output_file"
  echo "✅ Template copied successfully"
  exit 0
fi

# Check if correct number of arguments provided for PDF generation
if [ $# -ne 5 ]; then
  echo "❌ Error: Invalid number of arguments"
  echo "Usage:"
  echo "  Copy template: <thing> <version> template <output.tex>"
  echo "  Generate PDF: <thing> <version> <colorscheme> <input.tex> <output.pdf>"
  echo ""
  echo "Parameters:"
  echo "  thing: playbook (p)"
  echo "  version: dw1 (1) or dw2 (2)"
  echo "  colorscheme: light (l) or dark (d)"
  echo "  input.tex: source tex file"
  echo "  output.pdf: output PDF file"
  exit 1
fi

# Parse PDF generation arguments: <thing> <version> <colorscheme> <input.tex> <output.pdf>
thing=$(normalize_thing "$1")
version=$(normalize_version "$2")
mode=$(normalize_colorscheme "$3")
texfile="$4"
output_pdf="$5"

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
  if [ "$VERBOSE" = "true" ]; then
    echo "Running pdflatex with dark mode..."
    pdflatex -interaction=nonstopmode -file-line-error "\\def\\DARKMODE{1} \\input{$texfile}"
  else
    echo "Running pdflatex with dark mode..."
    pdflatex -interaction=nonstopmode -file-line-error "\\def\\DARKMODE{1} \\input{$texfile}" >/dev/null 2>&1
  fi
else
  if [ "$VERBOSE" = "true" ]; then
    echo "Running pdflatex..."
    pdflatex -interaction=nonstopmode -file-line-error "$texfile"
  else
    echo "Running pdflatex..."
    pdflatex -interaction=nonstopmode -file-line-error "$texfile" >/dev/null 2>&1
  fi
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
