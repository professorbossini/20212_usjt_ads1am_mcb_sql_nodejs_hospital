const express = require('express');
const app = express();
const mysql = require('mysql2');
app.use(express.json());

const porta = 3000;

app.get('/medicos', (req, res) => {
    const connection = mysql.createConnection({
        host: 'localhost',
        user: 'rodrigo',
        password: '1234',
        database: '20212_usjt_ads1ammcb_hospital',
    })

    const comandoSQL = 'SELECT * FROM tb_medico'

    connection.query(comandoSQL, (erro, resultados, campos) => {
        console.log(erro)
        console.log(resultados)
        console.log(campos)
        res.end()
    })
})

app.listen(porta, () => {
    console.log(`Executando. Porta: ${porta}`)
})