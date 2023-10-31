const sqlServer = require('mssql');
const bdConfig = require('./bdConfig');

async function conectar(){
    try {
        const conexao = await sqlServer.connect(`Server=${bdConfig.servidor},1433;
                                                Database=${bdConfig.bancoDeDados};
                                                User Id=${bdConfig.usuario};
                                                Password=${bdConfig.senha};
                                                Encrypt=false`);
                                                
        return conexao;
        
    } catch (error) {
        return null;
    }
}

module.exports = { conectar }