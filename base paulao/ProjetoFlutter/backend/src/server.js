const app = require('./app');
const porta = 2008

app.listen(porta, () => {
    console.log(`Servidor funcionando na porta: ${porta}`)
})