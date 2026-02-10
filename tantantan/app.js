const express = require('express');
const app = express();
const mysql = require('./mysql');

app.get('/pace_de_moto', (req, res, next) => {
    return res.status(200).sendFile('senna.html', {root: './'})
});

app.get('/pilotos/:id', async (req, res, next) => {
    const idev4 = req.params.id;
    const result = await mysql.execute("SELECT * FROM pilotos H+WHERE ");
    return res.status(200).json(result);
});


app.get("/pilotos", async (req, res) =>{
    const result = await mysql.execute("SELECT * FROM pilotos");
    return res.status(200).json(result);
})
app.use((req, res, next) => {
    const error = new Error("Not found...");
    error.status = 404;
    next(error);
});

module.exports = app;