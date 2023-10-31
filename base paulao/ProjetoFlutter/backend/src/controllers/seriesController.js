const Comunicado = require('./comunicado');
const Serie = require('../bd/dbo/Serie');
const Series = require('../bd/dao/Series');
const Bd = require('../bd/conexao');
const BdConfig = require('../bd/bdConfig');

async function recuperarTodos(req, res) {
    if (Object.values(req.body).length != 0) {
        const erro = Comunicado.novo('DSP', 'Fornecimento de dados sem propósito', 'Foram fornecidos dados sem haver nescessidade.').object

        return res.status(422).json(erro);

    }

    const ret = await Series.recuperarTodos();

    if (ret === null) {
        const erro = Comunicado.novo('CBD', 'Sem conexão com o BD', 'Não foi possível estabeler uma conexão com o banco de dados.').object;
        return res.status(500).json(erro);
    }

    if (ret === false) {
        const erro = Comunicado.novo('FNC', 'Falha no comando SQL', 'O comando SQL apresenta algum erro.').object;
        return res.status(409).json(erro);

    }

    return res.status(200).json(ret);
}

async function recuperarUm(req, res) {
    if (Object.values(req.body).length != 0) {
        const erro = Comunicado.novo('DSP', 'Fornecimento de dados sem propósito', 'Foram fornecidos dados sem haver nescessidade.').object
        return res.status(422).json(erro);

    }

    const titulo = req.params.titulo;

    const ret = await Series.recuperarUm(titulo);

    if (ret === null) {
        const erro = Comunicado.novo('CBD', 'Sem conexão com o BD', 'Não foi possível estabeler uma conexão com o banco de dados.').object;
        return res.status(500).json(erro);

    }

    if (ret === false) {
        const erro = Comunicado.novo('FNC', 'Falha no comando SQL', 'O comando SQL apresenta algum erro.').object;
        return res.status(409).json(erro);

    }

    if (ret.length == 0) {
        const erro = Comunicado.novo('SNE', 'Série inexistente', 'Não há uma série contendo este título.').object;
        return res.status(409).json(erro);

    }

    return res.status(200).json(ret);
}

async function inclusao(req, res) {
    if (Object.values(req.body).length != 6 || !req.body.titulo || !req.body.genero || !req.body.temporadas || !req.body.emissora || !req.body.sinopse || !req.body.imagem) {
        const erro = Comunicado.novo('DdI', 'Dados inesperados', 'Não foram fonecidos exatamente as 6 informações esperadas de uma série (título, gênero, temporadas, emissora, sinopse, imagem).').object;

        return res.status(422).json(erro);

    }

    let serie;
    try {
        serie = Serie.novo(req.body.titulo, req.body.genero, req.body.temporadas, req.body.emissora, req.body.sinopse, req.body.imagem);

    } catch (error) {
        const erro = Comunicado.novo('TDE', 'Dados de tipos errados', 'Título, gênero, emissora e sinopse devem ser textos não vazios, temporadas deve ser um número natural e imagem deve ser uma URL de uma imagem.').object;
        return res.status(422).json(erro);

    }

    const ret = await Series.incluir(serie);

    if (ret === null) {
        const erro = Comunicado.novo('CBD', 'Sem conexão com o BD', 'Não foi possível estabeler uma conexão com o banco de dados.').object;
        return res.status(500).json(erro);

    }

    if (ret === false) {
        const erro = Comunicado.novo('SJE', 'Série já cadastrada', 'Já existe um seriado contendo este título.').object;
        return res.status(409).json(erro);

    }

    return res.status(200).json('Série incluída com sucesso !!')
}

//Ana Beatriz
async function atualizar(req, res) {

}

//Mayer
async function deletar(req, res) {
    if (Object.values(req.params).length != 1 || !req.params.titulo) {
        const erro = Comunicado.novo('DNF', 'Dado não fornecido!').object;

        return res.status(422).json(erro);

    }

    const ret = await Series.deletar(req.params.titulo);

    if (ret === null) {
        const erro = Comunicado.novo('CBD', 'Sem conexão com o BD', 'Não foi possível estabeler uma conexão com o banco de dados.').object;
        return res.status(500).json(erro);

    }

    if (ret === false) {
        const erro = Comunicado.novo('SJD', 'Série já deletada', 'Não existe um seriado contendo este título.').object;
        return res.status(409).json(erro);

    }

    return res.status(200).json('Série deletada com sucesso !!')
}

module.exports = { inclusao, recuperarTodos, recuperarUm, atualizar, deletar }