class Serie{
    #titulo;
    #genero;
    #temporadas;
    #emissora;
    #sinopse;
    #imagem;

    constructor(titulo, genero, temporadas, emissora, sinopse, imagem){
        this.titulo = titulo;
        this.genero = genero;
        this.temporadas = temporadas;
        this.emissora = emissora;
        this.sinopse = sinopse;
        this.imagem = imagem;
    }

    get titulo(){
        return this.#titulo;
    }

    get genero(){
        return this.#genero;
    }

    get temporadas(){
        return this.#temporadas;
    }

    get emissora(){
        return this.#emissora;
    }

    get sinopse(){
        return this.#sinopse;
    }

    get imagem(){
        return this.#imagem;
    }

    set titulo(novoTitulo){
        if(novoTitulo === undefined || typeof novoTitulo !== 'string' || novoTitulo === "")
            throw ('Título inválido');

        this.#titulo = novoTitulo;
    }

    set genero(novoGenero){
        if(novoGenero === undefined || typeof novoGenero !== 'string' || novoGenero === "")
            throw ('Gênero inválido');

        this.#genero = novoGenero;
    }

    set temporadas(novasTemporadas){
        if(novasTemporadas === undefined || typeof novasTemporadas !== 'number' || isNaN(novasTemporadas) || novasTemporadas !== parseInt(novasTemporadas) || novasTemporadas <= 0)
            throw ('Temporada(s) inválida');

        this.#temporadas = novasTemporadas;
    }

    set emissora(novaEmissora){
        if(novaEmissora === undefined || typeof novaEmissora !== 'string' || novaEmissora === "")
            throw ('Emissora inválida');

        this.#emissora = novaEmissora;
    }

    set sinopse(novaSinopse){
        if(novaSinopse === undefined || typeof novaSinopse !== 'string' || novaSinopse === "")
            throw ('Sinopse inválida');

        this.#sinopse = novaSinopse;
    }

    set imagem(novaImagem){
        if(novaImagem === undefined || typeof novaImagem !== 'string' || novaImagem === "")
            throw ('Imagem inválida');

        this.#imagem = novaImagem;
    }
}

function novo(titulo, genero, temporadas, emissora, sinopse, imagem) {
    return new Serie(titulo, genero, temporadas, emissora, sinopse, imagem);
}

module.exports = { novo }