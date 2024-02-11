# Authelia

Authelia configuration defaults to using `users.yml` in `$APP_DATA_PATH/authelia/data`.

This behavior can be changed in the template at `$APP_DATA_PATH/authelia/config/configuration.yml`.

The format for the users file database can be found in the Authelia documentation. Use `authelia hash-password` inside the docker container to generate user passwords.