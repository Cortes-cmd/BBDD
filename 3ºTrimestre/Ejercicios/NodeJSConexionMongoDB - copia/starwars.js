const express = require('express');
const mongoose = require('mongoose');
const path = require('path');


const app = express();
const PORT = 3000;


// Conectar a MongoDB local
mongoose.connect('mongodb://localhost:27017/cine');


// Definir el esquema. Cada esquema está asociado a una colección.
const Pelicula = mongoose.model('Pelicula', new mongoose.Schema({}, { strict: false }));


// Servir archivos estáticos
app.use(express.static(path.join(__dirname, 'public')));


// API para obtener películas
app.get('/api/peliculas', async (req, res) => {
  const peliculas = await Pelicula.find();
  res.json(peliculas);
});


app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});

// API para obtener películas
app.get('/api/peliculas', async (req, res) => {
  const peliculas = await Pelicula.find();
  res.json(peliculas);
});
app.get('/api/peliculas/episodio/:num', async (req, res) => {
  const pelicula = await Pelicula.findOne({ episodio: parseInt(req.params.num) });
  res.json(pelicula);
});
app.get('/api/peliculas/director/:nombre', async (req, res) => {
  const peliculas = await Pelicula.find({ director: req.params.nombre });
  res.json(peliculas);
});
app.get('/api/peliculas/buscar/:texto', async (req, res) => {
  const texto = req.params.texto;


  // Usamos una expresión regular para búsqueda parcial (case-insensitive)
  const peliculas = await Pelicula.find({
    titulo: { $regex: texto, $options: 'i' }
  });


  res.json(peliculas);
});
