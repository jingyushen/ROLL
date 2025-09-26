#!/bin/bash
set +x

ROLL_PATH="/workspace/ROLL"
CONFIG_PATH=$(basename $(dirname $0))
export PYTHONPATH="$ROLL_PATH:$PYTHONPATH"
export MODEL_DOWNLOAD_TYPE="MODELSCOPE"
export PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python
/usr/bin/python /workspace/ROLL/examples/start_agentic_pipeline.py --config_path $CONFIG_PATH  --config_name agent_val_frozen_lake_single_node_demo
