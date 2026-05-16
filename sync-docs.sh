#!/bin/bash
# Sync script to copy content from source directories to docs folder
# This ensures the docs folder always has the latest content

set -e

echo "Starting content sync to docs folder..."

# Create docs directory structure
mkdir -p docs/{anatomy,physiology,pathology,pharmacology,medicine,surgery,obsgyn,pediatrics}

# Copy README as index.md
echo "Copying README.md to docs/index.md..."
cp README.md docs/index.md

# Copy Cardiac Cycle material to physiology folder
echo "Copying Cardiac Cycle material..."
if [ -f "Cardiac_Cycle_Study_Material.md" ]; then
  cp Cardiac_Cycle_Study_Material.md docs/physiology/01-cardiac-cycle.md
fi

# Function to copy markdown files from a directory
copy_subject_files() {
  local source_dir=$1
  local dest_dir=$2
  local subject_name=$3

  if [ -d "$source_dir" ]; then
    echo "Copying $subject_name files..."
    # Remove old files first
    rm -f "$dest_dir"/*.md
    # Copy new files
    find "$source_dir" -maxdepth 1 -name "*.md" -exec cp {} "$dest_dir/" \;
    echo "  ✓ Copied files from $source_dir"
  else
    echo "  ⚠ Directory $source_dir not found, skipping..."
  fi
}

# Copy all subject files
copy_subject_files "Anatomy" "docs/anatomy" "Anatomy"
copy_subject_files "Physiology" "docs/physiology" "Physiology"
copy_subject_files "Pathology" "docs/pathology" "Pathology"
copy_subject_files "Pharmacology" "docs/pharmacology" "Pharmacology"
copy_subject_files "Medicine" "docs/medicine" "Medicine"
copy_subject_files "Surgery" "docs/surgery" "Surgery"
copy_subject_files "ObsGyn" "docs/obsgyn" "ObsGyn"
copy_subject_files "Pediatrics" "docs/pediatrics" "Pediatrics"

echo ""
echo "✓ Content sync completed successfully!"
echo "You can now run 'mkdocs serve' to preview the site locally"
echo "or commit and push to deploy to GitHub Pages"
