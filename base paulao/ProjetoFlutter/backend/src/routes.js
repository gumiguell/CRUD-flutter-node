const express = require('express')
const seriesController = require('./controllers/seriesController')

const router = express.Router()

router.get('/series', seriesController.recuperarTodos);
router.get('/series/:titulo', seriesController.recuperarUm);
router.post('/series/incluir', seriesController.inclusao);

//Ana Beatriz
router.put('/');

//Mayer
router.delete('/series/deletar/:titulo', seriesController.deletar);

module.exports = router