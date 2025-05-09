#!/bin/bash

# Base ComfyUI path - change this if your setup is different
COMFYUI_DIR="/workspace/ComfyUI"

# Create required directories
mkdir -p "$COMFYUI_DIR/models/clip_vision"
mkdir -p "$COMFYUI_DIR/models/ipadapter"
mkdir -p "$COMFYUI_DIR/models/checkpoints"
mkdir -p "$COMFYUI_DIR/models/loras"

echo "✅ Created required folders."

# ------------------------------
# Download Checkpoints
# ------------------------------

echo "⬇️ Downloading Checkpoint models..."

declare -A checkpoint_models=(
    ["https://huggingface.co/autismanon/modeldump/resolve/main/aziibpixelmix_v10.safetensors"]="aziibpixelmix_v10.safetensors"
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
    ["https://huggingface.co/nerijs/pixel-art-xl/resolve/main/pixel-art-xl.safetensors"]="pixel-art-xl.safetensors"
    ["https://huggingface.co/dfsdsdfsdfsdfsdfsdfsdf/pixel/resolve/main/pixel-art-xl-v1.1.safetensors"]="pixel-art-xl-v1.1.safetensors"
)

for url in "${!lora_models[@]}"; do
    filename="${lora_models[$url]}"
    wget -q --show-progress "$url" -O "$COMFYUI_DIR/models/loras/$filename"
done

echo "✅ Lora models downloaded."

echo -e "\n🎉 Model download complete."

# ------------------------------
# Download CLIP Vision Encoders
# ------------------------------

echo "⬇️ Downloading CLIP Vision encoders..."

declare -A clip_vision_models=(
    ["https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors"]="CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors"
    ["https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/image_encoder/model.safetensors"]="CLIP-ViT-bigG-14-laion2B-39B-b160k.safetensors"
    ["https://huggingface.co/Kwai-Kolors/Kolors-IP-Adapter-Plus/resolve/main/image_encoder/pytorch_model.bin"]="clip-vit-large-patch14-336.bin"
)

for url in "${!clip_vision_models[@]}"; do
    filename="${clip_vision_models[$url]}"
    wget -q --show-progress "$url" -O "$COMFYUI_DIR/models/clip_vision/$filename"
done

echo "✅ CLIP Vision models downloaded."

# ------------------------------
# Download IPAdapter Models
# ------------------------------

echo "⬇️ Downloading IPAdapter models..."

declare -A ipadapter_models=(
    ["https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15.safetensors"]="ip-adapter_sd15.safetensors"
    ["https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15_light_v11.bin"]="ip-adapter_sd15_light_v11.bin"
    ["https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus_sd15.safetensors"]="ip-adapter-plus_sd15.safetensors"
    ["https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus-face_sd15.safetensors"]="ip-adapter-plus-face_sd15.safetensors"
    ["https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-full-face_sd15.safetensors"]="ip-adapter-full-face_sd15.safetensors"
    ["https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter_sd15_vit-G.safetensors"]="ip-adapter_sd15_vit-G.safetensors"
    ["https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl_vit-h.safetensors"]="ip-adapter_sdxl_vit-h.safetensors"
    ["https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors"]="ip-adapter-plus_sdxl_vit-h.safetensors"
    ["https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus-face_sdxl_vit-h.safetensors"]="ip-adapter-plus-face_sdxl_vit-h.safetensors"
    ["https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter_sdxl.safetensors"]="ip-adapter_sdxl.safetensors"
)

for url in "${!ipadapter_models[@]}"; do
    filename="${ipadapter_models[$url]}"
    wget -q --show-progress "$url" -O "$COMFYUI_DIR/models/ipadapter/$filename"
done

echo "✅ IPAdapter models downloaded."

# ------------------------------
# Download FaceID Models
# ------------------------------

echo "⬇️ Downloading FaceID models..."

declare -A faceid_models=(
    ["https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sd15.bin"]="ip-adapter-faceid_sd15.bin"
    ["https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sd15.bin"]="ip-adapter-faceid-plusv2_sd15.bin"
    ["https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait-v11_sd15.bin"]="ip-adapter-faceid-portrait-v11_sd15.bin"
    ["https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid_sdxl.bin"]="ip-adapter-faceid_sdxl.bin"
    ["https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sdxl.bin"]="ip-adapter-faceid-plusv2_sdxl.bin"
    ["https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait_sdxl.bin"]="ip-adapter-faceid-portrait_sdxl.bin"
    ["https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-portrait_sdxl_unnorm.bin"]="ip-adapter-faceid-portrait_sdxl_unnorm.bin"
)

for url in "${!faceid_models[@]}"; do
    filename="${faceid_models[$url]}"
    wget -q --show-progress "$url" -O "$COMFYUI_DIR/models/ipadapter/$filename"
done

echo "✅ FaceID models downloaded."

echo -e "\n🎉 Installation complete. Please restart ComfyUI to load the new models."
