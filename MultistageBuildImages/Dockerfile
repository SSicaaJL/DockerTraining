# In multistage building, we can have multiple FROM instructions
# Each FROM instruction can be labelled as a stage
FROM ubuntu:18.04 as stage0

# Install git on it
RUN apt-get update && apt-get install -y git

# Use the previous stage as the base image
FROM stage0 as stage1

# Now we clone a git repository
RUN git clone https://github.com/SSicaaJL/DockerTraining.git

# The resulting docker image will only have 2 layers instead of 4
# Previous stage layers are merged into the new stage / used as a base layer in the new stage
# Each instruction is a layer, and layers are essentially folders or directories with unique identifiers
# With less layers, the less resources Docker would have to manage, leading to a smaller sized container
# We can build the first FROM as a base image and pull to use for the second FROM, but this leads to managing two Dockerfiles
# This resolves the issue with just one Dockerfile
