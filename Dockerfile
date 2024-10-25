FROM ubuntu:latest
LABEL authors="Isaiah"
WORKDIR /app

# Install system packages for Python
RUN apt-get update && apt-get install -y python3 python3-pip  python3.12-venv

# Create a virtual environment
RUN python3 -m venv env

# Activate the virtual environment
ENV PATH="/app/env/bin:$PATH"

# Install virtualenv INSIDE the virtual environment
RUN pip install virtualenv

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000"]