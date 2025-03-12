FROM ubuntu:22.04

# Set environment variables
ENV NB_USER=jupyter
ENV NB_UID=1000
ENV NB_GID=1000
ENV WORK_DIR=/home/$NB_USER
ENV BASE_URL="/"

# Create a non-root user and set working directory
RUN apt update && apt install -y python3 python3-pip && \
    groupadd -g $NB_GID $NB_USER && \
    useradd -m -u $NB_UID -g $NB_GID -s /bin/bash $NB_USER && \
    pip install --no-cache-dir keplergl jupyterlab ipywidgets && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Switch to non-root user
USER $NB_USER
WORKDIR $WORK_DIR

# Expose the JupyterLab port
EXPOSE 8888

# Set default command to launch JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888"]
