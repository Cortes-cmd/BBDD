/*fetch('/api/peliculas')
  .then(res => res.json())
  .then(data => {
    const contenedor = document.getElementById('peliculas');
    data.forEach(pelicula => {
      const div = document.createElement('div');
      div.innerHTML = `<h2>${pelicula.titulo}</h2><p>${pelicula.sinopsis}</p>`;
      contenedor.appendChild(div);
    });
  });
*/

function mostrarVista(vista) {
document.querySelector('.vista1').style.display = vista === 1 ? 'block' : 'none';
document.querySelector('.vista2').style.display = vista === 2 ? 'block' : 'none';
document.querySelector('.vista3').style.display = vista === 3 ? 'block' : 'none';
}

function filtrar() {
let filtro = document.getElementById('filtro').value.toLowerCase();
let tarjetas = document.querySelectorAll('.tarjeta');
tarjetas.forEach(t => {
t.style.display = t.textContent.toLowerCase().includes(filtro) ? 'block' : 'none';
});
}

    // Mostrar vista 1 por defecto
    mostrarVista(3);