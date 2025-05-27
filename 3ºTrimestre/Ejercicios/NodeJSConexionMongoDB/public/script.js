fetch('/api/peliculas')
  .then(res => res.json())
  .then(data => {
    const contenedor = document.getElementById('peliculas');
    data.forEach(pelicula => {
      const div = document.createElement('div');
      div.innerHTML = `<h2>${pelicula.titulo}</h2><p>${pelicula.sinopsis}</p>`;
      contenedor.appendChild(div);
    });
  });
