### Here are all the details required for running the ML flow project.
There is a requirements.txt file present in the folder. 
Use the following command to install all the adequate packages.
```
pip install -r requirements.txt
``` 
##### The following explort command is used to set the enviroment variable
```console
export MLFLOW_TRACKING_URI=sqlite:///mlruns.db
```
##### This command is used to train, compare, and register the model.
```
python train.py 8
```
##### The following command is used to serve the model. In our case, random-forest-model/1 is the mentioned model for deployment.
```
mlflow models serve --model-uri models:/random-forest-model/1 
--no-conda -h 0.0.0.0 -p 5000
```
##### To containerized a model use the following command
```
mlflow models build-docker -m "/mlruns/0/1e5d5970803946b3a168fc1e9368e235/artifacts/model" 
-n "rfm-dep" --install-mlflow
```
* -m ( Pass the relative or absolute path of the model)
* -n ( Name of the Image to be created with the specified model)
* --install-mlflow ( Used for model serving )
