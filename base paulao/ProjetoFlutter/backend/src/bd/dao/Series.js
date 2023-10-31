const bd = require('../conexao')

async function recuperarTodos(){
    try {
        const conexao = await bd.conectar();
        if(conexao == null)
            return null;
    
        const comandoSql = 'SELECT * FROM series';
    
        const linhas = (await conexao.request().query(comandoSql)).recordset;
    
        return linhas;
        
    } catch (error) {
        return false;

    }

}

async function recuperarUm(titulo){
    try {
        const conexao = await bd.conectar();
        if(conexao == null)
            return null;
    
        const comandoSql = `SELECT * FROM series WHERE titulo = '${titulo}'`;
    
        const linhas = (await conexao.request().query(comandoSql)).recordset[0];
    
        return linhas;
        
    } catch (error) {
        return false;

    }

}

async function incluir(serie){
    
    try {
        const conexao = await bd.conectar();
        
        if(conexao == null)
            return null;
            
        
        const dados = [serie.titulo, serie.genero, serie.temporadas, serie.emissora, serie.sinopse, serie.imagem];
        const comandoSql = `INSERT INTO series (titulo, genero, temporadas, emissora, sinopse, imagem) VALUES ('${String(dados[0])}', '${String(dados[1])}', ${dados[2]}, '${String(dados[3])}', '${String(dados[4])}', '${String(dados[5])}')`;
        
        
        await conexao.query(comandoSql, dados)
        
        return true;
        
    } catch (error) {
        return false;

    }

}

//Ana Beatriz
async function atulizar(){

}

//Mayer
async function deletar(titulo){

    try {
        const conexao = await bd.conectar();
        
        if(conexao == null)
            return null;
            
        const dados = [titulo];
        const comandoSql = `DELETE FROM series WHERE titulo = '${String(dados[0])}'`;
        console.log(comandoSql)
        
        
        await conexao.query(comandoSql)
        
        return true;
        
    } catch (error) {
        return false;

    }

}

module.exports = { recuperarTodos, recuperarUm, incluir, atulizar, deletar }