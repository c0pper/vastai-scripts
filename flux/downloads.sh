#!/bin/bash

# Toggle switches (1 = download, 0 = skip)
DL_T5XXL=1
DL_CLIP_L=1
DL_VAE=1
DL_CONTROLNET=1
DL_UPSCALE=1

# Download paths and URLs
if [ "$DL_T5XXL" -eq 1 ]; then
    wget -P /workspace/ComfyUI/models/clip \
    https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors
fi

if [ "$DL_CLIP_L" -eq 1 ]; then
    wget -P /workspace/ComfyUI/models/clip \
    https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors
fi

if [ "$DL_VAE" -eq 1 ]; then
    wget -P /workspace/ComfyUI/models/vae \
    https://huggingface.co/camenduru/FLUX.1-dev/resolve/d616d290809ffe206732ac4665a9ddcdfb839743/ae.safetensors
fi

if [ "$DL_CONTROLNET" -eq 1 ]; then
    wget -P /workspace/ComfyUI/models/controlnet \
    https://huggingface.co/Shakker-Labs/FLUX.1-dev-ControlNet-Union-Pro/resolve/main/diffusion_pytorch_model.safetensors
fi

if [ "$DL_UPSCALE" -eq 1 ]; then
    wget -P /workspace/ComfyUI/models/upscale_models \
    https://huggingface.co/skbhadra/ClearRealityV1/resolve/bc01e27b38eec683dc6e3161dd56069c78e015ac/4x-ClearRealityV1.pth
fi
