import subprocess
# subprocess.run[("ls","l")]
# subprocess.call(['ping', 'localhost'])
subprocess.call(['python','train.py'])
subprocess.call(['mlflow models serve --model-uri models:/random-forest-model/1 --no-conda -h 0.0.0.0 -p 1234 '])
# python train.py 8 && mlflow models serve --model-uri models:/random-forest-model/1 --no-conda -h 0.0.0.0 -p 1234 
