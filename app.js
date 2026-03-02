const express = require("express");
const app = express();
const mysql = require('./mysql');

app.get("/pace-de-moto", (req, res, next) => {
    return res.status(200).sendFile("senna.html", {root: './'});
});

app.get("/pilotos", async (req, res) => {
    const result = await mysql.execute("SELECT * FROM pilotos");
    return res.status(200).json(result);
});

app.get("/equipes", async (req, res) => {
    const result = await mysql.execute("SELECT nome  FROM equipes");
    return res.status(200).json(result);
});

app.post("/temporada", async (req, res)=>{
    const temporada = req.body.temporada;
    const result = await mysql.execute("INSERT INTO temporadas(ano) VALUES = ?", [temporada]);
    return res.status(201).json(result);
})

app.get("/pilotos/:id", async (req, res) => {
    const id = req.params.id;
    const result = await mysql.execute("SELECT * FROM pilotos WHERE id_piloto = ? ", [id]);
    return res.status(200).json(result);
});

app.use((req, res, next)=> {
    const error = new Error("Not found...");
    error.status = 404;
    next(error);
});

module.exports = app;
