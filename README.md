## Prerequisites
* Install [Terraform][1]
* AWS credentials and a pem file

## Usage

1. Update the `terraform.tfvars` file with your AWS credentials:

    ```
    access_key = my_AWS_access_key
    secret_key = my_AWS_secret_key
    ssh_key_name = name_of_my_PEM_file_for_AWS
    ```
2. Move your pem file to the root of the project
3. Execute terraform plan
    ```
    $ terraform plan
    ```
4. Then execute apply
    ```
    $ terraform plan
    ```

__Useful commands__
`terraform validate`
`terraform fmt`
`terraform plan`
`terraform graph | dot -Tpng > graph.png`
`watch kubectl get pods -n devops`

## Start Postgres container
To start your Postgres container run
  * Download image `run docker-compse up -d`
  * Check the container id `docker ps`
  * Change permissions `docker exec -it 375f2ac24c42 chown postgres.postgres /var/lib/postgres/db.out`
  * Get into the container `docker exec -it containerid bash`
  * Run the next commands `su postgres` and then `psql -h localhost  -p 5432 < /var/lib/postgres/db.out`
  * Exit the postgres user with the next command `exit`
  * Again to log out the root user `exit`

## Starting Server    
To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
