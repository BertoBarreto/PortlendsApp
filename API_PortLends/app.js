const express = require('express')
const cors = require('cors')
const app = express();
const produtos_route = require('./routes/produtos_route')
const produto_route = require('./routes/produto_route')
const users_route = require('./routes/users_route')
const categorias_route = require('./routes/categorias_route')
const subcategorias_route = require('./routes/subcategorias_route')
const login_route = require('./routes/login_route')
app.use(cors({credentials: true,origin: true}));
app.use(express.json());

app.use("/api/v1/users",users_route)
app.use("/api/v1/produtos",produtos_route)
app.use("/api/v1/produto",produto_route)
app.use("/api/v1/categorias",categorias_route)
app.use("/api/v1/subcategorias",subcategorias_route)
app.use("/api/v1/login",login_route)

module.exports = app


