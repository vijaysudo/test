# Use the official Python image as a base image
FROM python:3.8

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container


# Install any dependencies
RUN apt install  pip  
# Copy the rest of the application code into the container
COPY 

# Expose the port that Flask will run on
EXPOSE 5001

# Command to run your application
CMD ["python", "app.py"]
