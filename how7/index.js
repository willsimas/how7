const express = require('express');
const app = express();
const mysql = require("mysql");

// Define variáveis do MYSQL
const MYSQL_IP = "127.0.0.1";
const MYSQL_LOGIN = "root";
const MYSQL_PASSWORD = "";

// Monta Conexão
const con = mysql.createConnection({
  host: MYSQL_IP,
  user: MYSQL_LOGIN,
  password: MYSQL_PASSWORD,
  database: "how7",
});

// Realiza conexão com MySQL
con.connect(function (err) {
  if (err) {
    console.log(err);
    throw err;
  }
  console.log("Conexão Estabelecida!");
});

// Monta Query de Busca para Parte 1
const sqlParte1 =
  "SELECT p.id AS id_venda, p.data_do_pagamento AS data_do_pagamento, p.valor_do_pagamento AS valor_do_pagamento, i.id AS codigo_imovel, i.descricao AS descricao_imovel, t.name AS tipo_imovel FROM pagamentos p JOIN imoveis i ON p.fk_id_imovel = i.id JOIN tipo_imovel t ON i.fk_id_tipo_imovel = t.id ORDER BY id_venda";

// Executa Query para Parte 1
if (con.query(sqlParte1)) {
  console.log("Query da Parte 1 Realizada com sucesso!");
} else {
  console.log("Ocorreu um erro na Parte 1!");
}

// Adiciona rotas da Parte 2 após a Parte 1

// Rota para obter a lista de ID de imóveis e a soma de pagamentos
app.get('/imoveis-soma-pagamentos', (req, res) => {
  const sql = 'SELECT i.id AS id_imovel, SUM(p.valor_do_pagamento) AS soma_pagamentos FROM imoveis i JOIN pagamentos p ON i.id = p.fk_id_imovel GROUP BY id_imovel';

  con.query(sql, (err, results) => {
    if (err) {
      console.log(err);
      res.status(500).json({ error: 'Erro ao buscar dados.' });
      return;
    }
    res.json(results);
  });
});

// Rota para obter a lista de mês/ano e o total de vendas
app.get('/vendas-por-mes', (req, res) => {
  const sql = 'SELECT DATE_FORMAT(p.data_do_pagamento, "%m/%Y") AS mes_ano, SUM(p.valor_do_pagamento) AS total_vendas FROM pagamentos p GROUP BY mes_ano';

  con.query(sql, (err, results) => {
    if (err) {
      console.log(err);
      res.status(500).json({ error: 'Erro ao buscar dados.' });
      return;
    }
    res.json(results);
  });
});

// Rota para obter a lista de tipo de imóvel e valor percentual no total de vendas
app.get('/vendas-por-tipo-imovel', (req, res) => {
  const sql = 'SELECT t.name AS tipo_imovel, SUM(p.valor_do_pagamento) / (SELECT SUM(valor_do_pagamento) FROM pagamentos) * 100 AS percentual_vendas FROM pagamentos p JOIN imoveis i ON p.fk_id_imovel = i.id JOIN tipo_imovel t ON i.fk_id_tipo_imovel = t.id GROUP BY tipo_imovel';

  con.query(sql, (err, results) => {
    if (err) {
      console.log(err);
      res.status(500).json({ error: 'Erro ao buscar dados.' });
      return;
    }
    res.json(results);
  });
});

// Defina a porta em que o servidor irá escutar
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Servidor ouvindo na porta ${PORT}`);
});
