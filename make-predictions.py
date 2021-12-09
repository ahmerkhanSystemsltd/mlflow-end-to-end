import json
import requests
import pandas as pd
import mlflow
port = 8000
# port = 5001
# port = 5001
#ip = "20.62.252.142"
#ip = "20.102.18.54"
ip = "20.120.57.193"
# ip = "0.0.0.0"
if __name__ == '__main__':
    df = pd.read_csv ('heart.csv')
    X = df.drop(['target'], axis=1)
#    print(X)
    D=X.iloc[:2]
#    print(D)
    input_data = D.to_json(orient="split")
#    print(input_data)
    #endpoint = "http://{}/invocations".format(ip)
    endpoint = "http://{}:{}/invocations".format(ip,port)
    headers = {"Content-type": "application/json; format=pandas-records"}
#    print(headers)
    prediction = requests.post(endpoint, json=json.loads(input_data))
    print(prediction.text)
