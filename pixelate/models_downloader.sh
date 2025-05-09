#!/bin/bash

# Base ComfyUI path - change this if your setup is different
COMFYUI_DIR="/workspace/ComfyUI"

# Create required directories
mkdir -p "$COMFYUI_DIR/models/checkpoints"
mkdir -p "$COMFYUI_DIR/models/Lora"

echo "✅ Created required folders."

# ------------------------------
# Download Checkpoints
# ------------------------------

echo "⬇️ Downloading Checkpoint models..."

declare -A checkpoint_models=(
    ["https://huggingface.co/dfsdsdfsdfsdfsdfsdfsdf/pixel/resolve/main/pixel-art-xl-v1.1.safetensors?download=true"]="pixel-art-xl-v1.1.safetensors"
)

for url in "${!checkpoint_models[@]}"; do
    filename="${checkpoint_models[$url]}"
    wget -q --show-progress "$url" -O "$COMFYUI_DIR/models/checkpoints/$filename"
done

echo "✅ Checkpoint models downloaded."

# ------------------------------
# Download Lora Models
# ------------------------------

echo "⬇️ Downloading Lora models..."

declare -A lora_models=(
    ["https://huggingface.co/nerijs/pixel-art-xl/resolve/main/pixel-art-xl.safetensors?download=true"]="pixel-art-xl.safetensors"
    ["https://huggingface.co/dfsdsdfsdfsdfsdfsdfsdf/pixel/resolve/main/pixel-art-xl-v1.1.safetensors?download=true"]="pixel-art-xl-v1.1.safetensors"
)

for url in "${!lora_models[@]}"; do
    filename="${lora_models[$url]}"
    wget -q --show-progress "$url" -O "$COMFYUI_DIR/models/Lora/$filename"
done

echo "✅ Lora models downloaded."

echo -e "\n🎉 Model download complete."
