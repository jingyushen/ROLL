#!/bin/bash
set +x

ROLL_PATH="/workspace/ROLL"
CONFIG_PATH=$(basename $(dirname $0))
export PYTHONPATH="$ROLL_PATH:$PYTHONPATH"
export MODEL_DOWNLOAD_TYPE="MODELSCOPE"
export PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python

OVERRIDE_FILE="/workspace/ROLL/examples/agentic_demo/temp_override.yaml"
# 确保旧文件被删除，避免污染
rm -f "$OVERRIDE_FILE"

cat <<EOF > "$OVERRIDE_FILE"
exp_id: ${HYDRA_OVERRIDE_EXP_ID:-"unknown_exp"}
learning_rate: ${HYDRA_OVERRIDE_LR:-1.0e-6}

env_tag:
  - ${HYDRA_OVERRIDE_ENV_TAG:-"FrozenLake"}
EOF

/usr/bin/python /workspace/ROLL/examples/start_agentic_pipeline.py --config_path $CONFIG_PATH --config_name agent_val_frozen_lake_single_node_demo

