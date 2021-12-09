#!/bin/bash
export MLFLOW_TRACKING_URI=sqlite:///mlruns.db
python train.py 8 && mlflow models serve --model-uri models:/random-forest-model/1 --no-conda -h 0.0.0.0 -p 5000
