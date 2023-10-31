const express = require("express")
const app = express()

const cors = require("cors")

app.use(cors())

app.use(express.json())
//app.use(express.urlencoded({extend: true}))


let productData = []

app.get("/aves",(req,res) => {
    if(productData.length > 0){
        console.log("entrou no if")
        res.status(200).send({
            "status_code": 200,
            "ave": aveData
        })
    } else {
        console.log("entrou no else")
        res.status(200).send({
            "status_code": 200,
            "ave": aveData
        })
    }
})

app.post("/aves",(req,res) => {

    console.log("Resultado",req.body)
    
    const pdata = {        
        "id": req.body.id,
        "nomeCientifico": req.body.nomeCientifico,
        "nome": req.body.nome,
        "apelido": req.body.apelido,
        "link": req.body.link
    }

    aveData.push(adata)
    console.log("aveData", aveData)

    res.status(200).send({
        "status-code":200,
        "message": "Ave adicionada",
        "ave": adata
    })
})

app.listen(3000,() =>{
    console.log("Escutando a porta 3000")
})