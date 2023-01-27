const config = {
    connectionLimit: 10,
    host: GetConvar("stax_db_host", "localhost"),
    user: GetConvar("stax_db_user", "root"),
    password: GetConvar("stax_db_password", ""),
    database: GetConvar("stax_db_database", "personal"),
    dev: GetConvar("stax_db_devmode", "false")
};

module.exports = config;