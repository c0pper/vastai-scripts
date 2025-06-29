#!/bin/bash

echo "==== ComfyUI FLUX Download Script ===="
echo "Type 'y' to download, or any other key to skip."

# Ask user input for each model
read -p "Download T5XXL? (y/N): " yn
DL_T5XXL=0; [[ "$yn" == [Yy] ]] && DL_T5XXL=1

read -p "Download CLIP_L? (y/N): " yn
DL_CLIP_L=0; [[ "$yn" == [Yy] ]] && DL_CLIP_L=1

read -p "Download VAE? (y/N): " yn
DL_VAE=0; [[ "$yn" == [Yy] ]] && DL_VAE=1

read -p "Download ControlNet? (y/N): " yn
DL_CONTROLNET=0; [[ "$yn" == [Yy] ]] && DL_CONTROLNET=1

read -p "Download Upscale Model? (y/N): " yn
DL_UPSCALE=0; [[ "$yn" == [Yy] ]] && DL_UPSCALE=1

read -p "Download FLUX1-DEV UNet? (y/N): " yn
DL_FLUX1DEV=0; [[ "$yn" == [Yy] ]] && DL_FLUX1DEV=1

echo ""
echo "Starting downloads..."
echo ""

# Downloads
if [ "$DL_T5XXL" -eq 1 ]; then
    wget --no-clobber -P /workspace/ComfyUI/models/clip \
    https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors
fi

if [ "$DL_CLIP_L" -eq 1 ]; then
    wget --no-clobber -P /workspace/ComfyUI/models/clip \
    https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors
fi

if [ "$DL_VAE" -eq 1 ]; then
    wget --no-clobber -P /workspace/ComfyUI/models/vae \
    https://huggingface.co/camenduru/FLUX.1-dev/resolve/d616d290809ffe206732ac4665a9ddcdfb839743/ae.safetensors
fi

if [ "$DL_CONTROLNET" -eq 1 ]; then
    wget --no-clobber -P /workspace/ComfyUI/models/controlnet \
    https://huggingface.co/Shakker-Labs/FLUX.1-dev-ControlNet-Union-Pro/resolve/main/diffusion_pytorch_model.safetensors
fi

if [ "$DL_UPSCALE" -eq 1 ]; then
    wget --no-clobber -P /workspace/ComfyUI/models/upscale_models \
    https://huggingface.co/skbhadra/ClearRealityV1/resolve/bc01e27b38eec683dc6e3161dd56069c78e015ac/4x-ClearRealityV1.pth
fi

if [ "$DL_FLUX1DEV" -eq 1 ]; then
    wget --no-clobber -P /workspace/ComfyUI/models/unet \
    https://huggingface.co/Comfy-Org/flux1-dev/resolve/main/flux1-dev-fp8.safetensors
fi

echo ""
echo "✅
