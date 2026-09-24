variables "web_port" {
    type = map(number)
    descripcion = "Puerto externo para Nginx Frontend"
}
variables "api_port" {
    type = map(number)
    descripcion = "Puerto externo para Node Backend"
}
variables "db_port" {
    type = map(number)
    descripcion = "Puerto externo para PostgreSQL"
}