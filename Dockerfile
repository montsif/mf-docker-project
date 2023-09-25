FROM arjones/pyspark:2.4.5

# Install pip (Python package manager)
RUN apt-get update && apt-get install -y python3-pip

# Upgrade pip to the latest version
RUN python3 -m pip install --upgrade pip

# Install Plotly Express, SciPy, scikit-learn, and any other desired packages
RUN pip install plotly-express scipy scikit-learn
