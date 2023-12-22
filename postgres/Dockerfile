FROM postgres:16

# Add a non-root user to run the container
RUN groupadd -r postgres-admin && useradd -r -g postgres-admin postgres-admin

# Set the working directory and ownership
WORKDIR /usr/src/app
RUN chown -R postgres-admin:postgres-admin /usr/src/app

# logs
RUN mkdir -p /var/log/postgres/
RUN chown -R postgres-admin:postgres-admin /var/log/postgres/

RUN mkdir -p /var/lib/postgres/
RUN chown -R postgres-admin:postgres-admin /var/lib/postgres/

# Create a directory for configuration files
RUN mkdir -p /usr/src/app/config

# Copy necessary configuration files
COPY ./postgres.env /usr/src/app/postgres.env
COPY ./config/postgresql.conf ./config/pg_hba.conf /etc/postgresql/

# Copy the custom entrypoint script
COPY local-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/local-entrypoint.sh

# Set environment variables
ENV POSTGRES_USER=$USER
ENV POSTGRES_PASSWORD=$PASSWORD
ENV POSTGRES_DB=$DATABASE
ENV POSTGRES_PORT=$PORT

# Expose the database port
EXPOSE $POSTGRES_PORT

# Switch to the non-root user
USER postgres-admin

# Use an entrypoint script to set environment variables dynamically at runtime
ENTRYPOINT ["/usr/local/bin/local-entrypoint.sh"]

# Start PostgreSQL using the provided configuration file
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]

# FROM postgres:16

# # Create necessary directories with correct permissions
# RUN mkdir -p /var/log/postgres/ && chown -R postgres:postgres /var/log/postgres/

# # Copy necessary configuration files and set ownership
# COPY ./postgres.env /usr/src/app/postgres.env
# COPY ./config/postgresql.conf ./config/pg_hba.conf /etc/postgresql/
# RUN chown -R postgres:postgres /usr/src/app/config /etc/postgresql/postgresql.conf /etc/postgresql/pg_hba.conf

# # Copy the custom entrypoint script and set permissions
# COPY local-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/local-entrypoint.sh && chown postgres:postgres /usr/local/bin/local-entrypoint.sh

# # Set environment variables
# ENV POSTGRES_USER=$USER
# ENV POSTGRES_PASSWORD=$PASSWORD
# ENV POSTGRES_DB=$DATABASE
# ENV POSTGRES_PORT=$PORT

# # Expose the database port
# EXPOSE $POSTGRES_PORT

# # Switch to the non-root user
# USER postgres

# # Use an entrypoint script to set environment variables dynamically at runtime
# ENTRYPOINT ["/usr/local/bin/local-entrypoint.sh"]

# # Start PostgreSQL using the provided configuration file
# CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]