# Use Python 2.x image
FROM python:2.7-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install the dependencies
RUN pip install --upgrade pip && \
    pip install -U flask && \
    pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port that the Flask app runs on
EXPOSE 5000

# Set environment variables

# Set Flask to run on port 80
ENV FLASK_RUN_PORT=5000

# Set the Flask host to 0.0.0.0 to allow external connections
ENV FLASK_RUN_HOST=0.0.0.0

# Explicitly specify the entry point command
CMD ["python", "runserver.py", "--host=0.0.0.0", "--port=5000" ]

