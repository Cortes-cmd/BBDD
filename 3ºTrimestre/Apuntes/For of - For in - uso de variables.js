use('tienda');
db.productos.insertOne({
    "categoria": "Juguetes Educativos",
    "nombre": "Bloques de Construcción Creativa",
    "detalles": "Set de 150 piezas de bloques de construcción de colores, ideales para estimular la creatividad y habilidades motoras finas de niños a partir de 3 años.",
    "precio": 29.99,
    "stock": 120
  });
  db.productos.insertMany(
    [
        {
          "categoria": "Juguetes Educativos",
          "nombre": "Puzzle de Madera de Animales",
          "detalles": "Puzzle de madera natural con figuras de animales. Desarrolla la coordinación mano-ojo y el reconocimiento de formas y colores. A partir de 2 años.",
          "precio": 15.50,
          "stock": 75
        },
        {
          "categoria": "Juguetes Educativos",
          "nombre": "Kit de Ciencia para Niños",
          "detalles": "Set de experimentos de química básica, seguro y divertido para niños a partir de 6 años. Incluye tubos de ensayo, ingredientes y manual ilustrado.",
          "precio": 34.99,
          "stock": 50
        },
        {
          "categoria": "Juguetes de Exterior",
          "nombre": "Cometa Arcoíris Grande",
          "detalles": "Cometa de colores vibrantes, fácil de montar y volar. Ideal para días de viento en parques o playas. A partir de 5 años.",
          "precio": 18.00,
          "stock": 90
        },
        {
          "categoria": "Juguetes de Exterior",
          "nombre": "Cubo de Playa con Accesorios",
          "detalles": "Set de cubo, pala, rastrillo y moldes de figuras para jugar en la arena. Fabricado en plástico reciclado. A partir de 2 años.",
          "precio": 12.75,
          "stock": 130
        }
    ]);


use('tienda');
let product1 = db.productos.findOne({nombre: 'Cometa Arcoíris Grande'})._id;
let product2 = db.productos.findOne({nombre: 'Cubo de Playa con Accesorios'})._id;
console.log("Producto 1: "+product1);
console.log("Producto 2: "+product2);


// Crear primera factura.
db.facturas.insertOne({
    "numero": 1,
    "fecha": "2025-04-28",
    "cliente": {
      "nombre": "Laura Martínez",
      "email": "laura.martinez@example.com",
      "telefono": "123456789",
      "direccion": "Calle Falsa 123, Ciudad Imaginaria"
    },
    "detalle": [
      {
        "_id_producto": product1,
        "cantidad": 2,
        "precio": 18.00
      },
      {
        "_id_producto": product2,
        "cantidad": 1,
        "precio": 29.99
      }
    ],
  });
  
  use('tienda');
  let product1 = db.productos.findOne({nombre: 'Bloques de Construcción Creativa'})._id;
  let product2 = db.productos.findOne({nombre: 'Cubo de Playa con Accesorios'})._id;
  let product3 = db.productos.findOne({nombre: 'Kit de Ciencia para Niños'})._id;
  console.log("Producto 1: "+product1);
  console.log("Producto 2: "+product2);
  console.log("Producto 3: "+product3);
  // Crear la segunda factura
  db.facturas.insertOne({
    "numero": 2,
    "fecha": "2025-04-28",
    "cliente": {
      "nombre": "Carlos Gómez",
      "email": "carlos.gomez@example.com",
      "telefono": "987654321",
      "direccion": "Avenida Siempre Viva 742, Springfield"
    },
    "detalle": [
      {
        "_id_producto": product1,
        "cantidad": 1,
        "precio": 15.50
      },
      {
        "_id_producto": product2,
        "cantidad": 2,
        "precio": 34.99
      },
      {
        "_id_producto": product3,
        "cantidad": 3,
        "precio": 12.75
      }
    ],
  });
  
// Obtener partes de una factura.
use('tienda');
let cliente = db.facturas.findOne({'numero':1}).cliente;
console.log('Nombre: '+cliente.nombre);
console.log('Email :' +cliente.email);
console.log('Teléfono :' +cliente.telefono);
console.log('Dirección :' +cliente.direccion);
// Mostrar los detalles.
let detalles = db.facturas.findOne({'numero':1}).detalle
for (i of detalles){
    console.log(i);
};




// Obtener partes de una factura.
use('tienda')
let cliente = db.facturas.findOne(
    {'numero':1}
).cliente;
console.log('Nombre: '+cliente.nombre);
console.log('Email: '+cliente.email);
console.log('Teléfono: '+cliente.telefono);
console.log('Dirección: '+cliente.direccion);
// Mostrar los detalles.
let detalles = db.facturas.findOne(
    {'numero':1}
).detalle;

let importe = 0;


for (d of detalles) {
    console.log('Identificador: '+d._id_producto);
    let pro = db.productos.findOne(
        {'_id':d._id_producto}
    );
    console.log('Nombre: '+pro.nombre);
    console.log('Categoría: '+pro.categoria);
    console.log('Cantidad: '+d.cantidad);
    console.log('Precio: '+d.precio);
    let subtotal = d.cantidad * d.precio;
    console.log('Subtotal: '+subtotal);
    importe=importe +subtotal;
    console.log('Importe Total: '+importe);
}