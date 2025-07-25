#!/bin/bash

# Update the system
apt update -y

# Install Java 17 (OpenJDK), Maven, and Git
apt install -y openjdk-17-jdk maven git

# Move to ubuntu home
cd /home/ubuntu

# Clone the GitHub repo
git clone https://github.com/Trainings-TechEazy/test-repo-for-devops.git

# Change ownership so ubuntu user can access
chown -R ubuntu:ubuntu test-repo-for-devopscd

# Build the app
cd test-repo-for-devops
mvn clean package

# Create backend directory and copy built jar
mkdir -p /home/ubuntu/backend
cp target/hellomvc-0.0.1-SNAPSHOT.jar /home/ubuntu/backend/parcel.jar

# Run the app on port 80 in background
cd /home/ubuntu/backend
nohup java -jar parcel.jar --server.port=80 > app.log 2>&1 &
