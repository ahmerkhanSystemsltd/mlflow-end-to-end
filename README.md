
### The following explort command is used to set the enviroment variable 
```console


```
export MLFLOW_TRACKING_URI=sqlite:///mlruns.db
### This command is used to run the train command
python train.py 8 
### The followin command is used to serve the model. In our case random-forest-model/1 is the mentioned model for deployement.
mlflow models serve --model-uri models:/random-forest-model/1 --no-conda -h 0.0.0.0 -p 5000
