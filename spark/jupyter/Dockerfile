FROM jupyter/base-notebook

USER root
RUN conda update -n base -y conda && \
    conda install -y requests-kerberos && \
        conda install -y -c conda-forge plotly jupyterlab jupyterlab-dash widgetsnbextension nodejs ipywidgets "openjdk=8.0.192"

USER $NB_USER

RUN pip install --upgrade requests-kerberos pyspark==3.0.0 pandas numpy seaborn matplotlib

USER root

RUN apt update && apt install -y git && \
    rm -rf /var/lib/apt/lists/*

RUN cd /opt/conda/lib/python3.7/site-packages && \
    fix-permissions /home/$NB_USER


USER root

WORKDIR /home/$NB_USER

USER root
CMD ["start-notebook.sh", "--NotebookApp.iopub_data_rate_limit=1000000000"]

USER $NB_USER
# ENV PATH="/usr/lib/jvm/jdk1.8.0_221/bin:$PATH"
