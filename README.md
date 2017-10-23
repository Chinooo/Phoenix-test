## Start Postgres container
#To start your Postgres container run
  * run docker-compse up -d
#Check the container id
  * docker ps
#Change permissions
  * docker exec -it 375f2ac24c42 chown postgres.postgres /var/lib/postgres/db.out
#Get into the container
  * docker exec -it containerid bash
#Run the next commands
  * su postgres
  * psql -h localhost  -p 5432 < /var/lib/postgres/db.out
  * \q
#Exit the container
  * exit (to log out from postgres user)
  * exit (again to logout)

## Starting Server    
To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
