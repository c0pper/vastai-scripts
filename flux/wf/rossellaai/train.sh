accelerate launch \
  --mixed_precision bf16 \
  --num_cpu_threads_per_process 1 \
  sd-scripts/flux_train_network.py \
  --pretrained_model_name_or_path "/workspace/fluxgym/models/unet/flux1-dev.sft" \
  --clip_l "/workspace/fluxgym/models/clip/clip_l.safetensors" \
  --t5xxl "/workspace/fluxgym/models/clip/t5xxl_fp16.safetensors" \
  --ae "/workspace/fluxgym/models/vae/ae.sft" \
  --cache_latents_to_disk \
  --save_model_as safetensors \
  --sdpa --persistent_data_loader_workers \
  --max_data_loader_n_workers 2 \
  --seed 42 \
  --gradient_checkpointing \
  --mixed_precision bf16 \
  --save_precision bf16 \
  --network_module networks.lora_flux \
  --network_dim 4 \
  --optimizer_type adamw8bit \
  --learning_rate 8e-4 \
  --cache_text_encoder_outputs \
  --cache_text_encoder_outputs_to_disk \
  --fp8_base \
  --highvram \
  --max_train_epochs 16 \
  --save_every_n_epochs 4 \
  --dataset_config "/workspace/fluxgym/outputs/rossellaai/dataset.toml" \
  --output_dir "/workspace/fluxgym/outputs/rossellaai" \
  --output_name rossellaai \
  --timestep_sampling shift \
  --discrete_flow_shift 3.1582 \
  --model_prediction_type raw \
  --guidance_scale 1 \
  --loss_type l2 \