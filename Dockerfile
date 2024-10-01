# Use Python 2.x image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port that the Flask app runs on
EXPOSE 80

# Set environment variables
# Set the Flask application file to run
ENV FLASK_APP=app.py

# Set the Flask host to 0.0.0.0 to allow external connections
ENV FLASK_RUN_HOST=0.0.0.0

# Set Flask to run on port 80
ENV FLASK_RUN_PORT=80

# Run the Flask application
CMD ["flask", "run", "--host=0.0.0.0", "--port=80"]
