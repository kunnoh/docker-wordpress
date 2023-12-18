FROM postgres:latest

ENV POSTGRES_USER=$USER
ENV POSTGRES_PASSWORD=$PASSWORD
ENV POSTGRES_DB=$DATABASE

COPY postgresql.conf /etc/postgresql/postgresql.conf
COPY pg_hba.conf /etc/postgresql/pg_hba.conf

RUN chown postgres:postgres /etc/postgresql/postgresql.conf
RUN chown postgres:postgres /etc/postgresql/pg_hba.conf

RUN mkdir -p /var/lib/postgresql/data
RUN mkdir -p /usr/local/psql/data
RUN chown -R postgres:postgres /var/log/postgresql
RUN chown -R postgres:postgres /usr/local/psql

EXPOSE 5432

CMD [ "postgres", "-c", "config_file=/etc/postgresql/postgresql.conf" ]