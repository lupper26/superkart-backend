FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy all files from the current directory to the container's working directory
COPY . .

# Install dependencies from the requirements file without using cache to reduce image size
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Define the command to start the application using Gunicorn with 4 worker processes
# - -w 4: Uses 4 worker processes for handling requests
# - -b 0.0.0.0:$PORT: Binds the server to the port Render assigns, on all network interfaces
# - app:superkart_api: Runs the Flask app instance named superkart_api in app.py
CMD gunicorn -w 4 -b 0.0.0.0:$PORT app:lupper_superkart_api

