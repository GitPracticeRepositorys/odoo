# Use the official Odoo base image
FROM odoo:14

# Set the maintainer
LABEL maintainer="raja <raja@143.gmail.com>"

# Set the Odoo configuration options
ENV ODOO_USER=your_username \
    ODOO_PASSWORD=your_password \
    ODOO_DATABASE=odoo

# Install additional dependencies
USER root
RUN set -e; \
    apt-get update --fix-missing && apt-get install -y --no-install-recommends \
        # Add any additional dependencies here, e.g., postgresql-client \
        && rm -rf /var/lib/apt/lists/*

# Copy custom addons into the Odoo addons directory
COPY ./addons /mnt/extra-addons

# Set the working directory
WORKDIR /mnt/extra-addons

# Expose the default Odoo port
EXPOSE 8069

# Set the default command to run when the container starts
CMD ["odoo"]

# Tag the image as 'latest'
ARG IMAGE_TAG=latest
ENV IMAGE_TAG=${IMAGE_TAG}
