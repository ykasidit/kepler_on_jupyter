FROM ubuntu:22.04

# Update package list and install Python3, pip, and Jupyter dependencies
RUN apt update && apt install -y python3 python3-pip && \
    pip install --no-cache-dir keplergl jupyterlab ipywidgets && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Set default command to launch Jupyter Notebook
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''"]
