FROM ubuntu:18.04
RUN apt-get -y update && apt-get install -y --no-install-recommends          wget          curl          nginx          ca-certificates          bzip2               openjdk-8-jdk          git-core          maven     && rm -rf /var/lib/apt/lists/*
RUN curl -L https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh >> miniconda.sh
RUN bash ./miniconda.sh -b -p /miniconda && rm ./miniconda.sh
ENV PATH="/miniconda/bin:$PATH"
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV GUNICORN_CMD_ARGS="--timeout 60 -k gevent"
WORKDIR /opt/mlflow
RUN pip install mlflow==1.22.0
RUN mvn  --batch-mode dependency:copy -Dartifact=org.mlflow:mlflow-scoring:1.22.0:pom -DoutputDirectory=/opt/java
RUN mvn  --batch-mode dependency:copy -Dartifact=org.mlflow:mlflow-scoring:1.22.0:jar -DoutputDirectory=/opt/java/jars
RUN cp /opt/java/mlflow-scoring-1.22.0.pom /opt/java/pom.xml
RUN cd /opt/java && mvn --batch-mode dependency:copy-dependencies -DoutputDirectory=/opt/java/jars
COPY model_dir/model /opt/ml/model
RUN python -c                 'from mlflow.models.container import _install_pyfunc_deps;                _install_pyfunc_deps(                    "/opt/ml/modelow=True,                     enable_mlserver=False)'
ENV MLFLOW_DISABLE_ENV_CREATION="true"
ENV ENABLE_MLSERVER=False
ENTRYPOINT ["python", "-c", "from mlflow.models import container as C; C._serve()"]
