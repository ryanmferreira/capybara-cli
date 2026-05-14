#!/bin/bash

# Target systems
SYSTEMS=("linux" "windows" "macosx" "bsd")

echo "Starting universal build..."

for os in "${SYSTEMS[@]}"; do
    echo "Building for OS: $os"
    
    # Generate the ninja file for the current OS
    premake5 ninja --os=$os
    
    # Run ninja for all release targets at once
    # This triggers release_x86_64, release_ARM, etc.
    ninja release_x86_64 release_x86 release_ARM release_ARM64 release_RISCV64 release_ppc release_ppc64
done

echo "All builds finished."