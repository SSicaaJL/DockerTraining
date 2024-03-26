
# Declare variables
ARG VERSION=18.04

# Build images - base_image:image_tag
# No tag, latest image will be use
FROM ubuntu:${VERSION}

# Shell form or exec form for no shell forms
RUN apt-get update && apt-get install -y curl nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# port/protocol - default protocol tcp
# Expose does not publish the port, it only lets docker knows the port that it is supposed to listen to
EXPOSE 80

# First process container will execute
# Use exec form
# If there are no entrypoint, docker will use the image entrypoint, or we could also have CMD
ENTRYPOINT ["nginx", "-g"]

# Does not get committed during image build time
# Reserved until the user image run
CMD ["daemon off;"]
