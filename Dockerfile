# Use official lightweight Python image
FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

# Copy dependency file first (for caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files
COPY . .

# Expose port (optional, mostly for documentation)
EXPOSE 80

# Command to run the app
CMD ["gunicorn", "-w", "3", "-b", "0.0.0.0:80", "app:app"]
