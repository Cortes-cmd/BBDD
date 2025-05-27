
use('cine');

// Insert a few documents into the sales collection.
db.peliculas.insertMany([
  {
    "titulo": "Star Wars: Episodio IV - Una nueva esperanza",
    "episodio": 4,
    "director": "George Lucas",
    "productor": ["Gary Kurtz", "George Lucas"],
    "estreno": "1977-05-25",
    "duracion_minutos": 121,
    "genero": ["Ciencia ficción", "Aventura", "Acción"],
    "sinopsis": "Luke Skywalker se une a un caballero Jedi, un contrabandista, un wookiee y dos droides para salvar a la galaxia del arma del Imperio, mientras intenta rescatar a la princesa Leia de las garras de Darth Vader.",
    "personajes": [
      {
        "nombre": "Luke Skywalker",
        "actor": "Mark Hamill",
        "rol": "Protagonista",
        "afiliacion": "Alianza Rebelde"
      },
      {
        "nombre": "Leia Organa",
        "actor": "Carrie Fisher",
        "rol": "Princesa y líder rebelde",
        "afiliacion": "Alianza Rebelde"
      },
      {
        "nombre": "Han Solo",
        "actor": "Harrison Ford",
        "rol": "Contrabandista",
        "afiliacion": "Independiente"
      },
      {
        "nombre": "Darth Vader",
        "actor": "David Prowse (voz: James Earl Jones)",
        "rol": "Villano principal",
        "afiliacion": "Imperio Galáctico"
      },
      {
        "nombre": "Obi-Wan Kenobi",
        "actor": "Alec Guinness",
        "rol": "Jedi Mentor",
        "afiliacion": "Jedi / Rebelde"
      }
    ],
    "planeta_principal": "Tatooine",
    "recaudacion_mundial_millones": 775,
    "distribuidora": "20th Century Fox"
  },
  {
    "titulo": "Star Wars: Episodio V - El Imperio contraataca",
    "episodio": 5,
    "director": "Irvin Kershner",
    "productor": ["Gary Kurtz"],
    "estreno": "1980-05-21",
    "duracion_minutos": 124,
    "genero": ["Ciencia ficción", "Aventura", "Acción"],
    "sinopsis": "Después de la destrucción de la Estrella de la Muerte, el Imperio ataca la base rebelde en Hoth. Luke viaja a Dagobah para entrenar con Yoda, mientras Vader intenta atraerlo al Lado Oscuro.",
    "personajes": [
      {
        "nombre": "Luke Skywalker",
        "actor": "Mark Hamill",
        "rol": "Protagonista",
        "afiliacion": "Alianza Rebelde"
      },
      {
        "nombre": "Yoda",
        "actor": "Frank Oz",
        "rol": "Maestro Jedi",
        "afiliacion": "Jedi"
      },
      {
        "nombre": "Han Solo",
        "actor": "Harrison Ford",
        "rol": "Contrabandista",
        "afiliacion": "Rebeldes"
      },
      {
        "nombre": "Darth Vader",
        "actor": "David Prowse (voz: James Earl Jones)",
        "rol": "Villano principal",
        "afiliacion": "Imperio Galáctico"
      },
      {
        "nombre": "Leia Organa",
        "actor": "Carrie Fisher",
        "rol": "Líder rebelde",
        "afiliacion": "Alianza Rebelde"
      }
    ],
    "planeta_principal": "Hoth",
    "recaudacion_mundial_millones": 538,
    "distribuidora": "20th Century Fox"
  },
  {
    "titulo": "Star Wars: Episodio VI - El retorno del Jedi",
    "episodio": 6,
    "director": "Richard Marquand",
    "productor": ["Howard G. Kazanjian", "George Lucas", "Rick McCallum"],
    "estreno": "1983-05-25",
    "duracion_minutos": 131,
    "genero": ["Ciencia ficción", "Aventura", "Acción"],
    "sinopsis": "Los rebeldes lanzan un ataque final contra el Imperio mientras Luke intenta redimir a su padre, Darth Vader, quien se enfrenta al Emperador.",
    "personajes": [
      {
        "nombre": "Luke Skywalker",
        "actor": "Mark Hamill",
        "rol": "Caballero Jedi",
        "afiliacion": "Alianza Rebelde"
      },
      {
        "nombre": "Leia Organa",
        "actor": "Carrie Fisher",
        "rol": "Comandante Rebelde",
        "afiliacion": "Alianza Rebelde"
      },
      {
        "nombre": "Han Solo",
        "actor": "Harrison Ford",
        "rol": "General Rebelde",
        "afiliacion": "Alianza Rebelde"
      },
      {
        "nombre": "Darth Vader",
        "actor": "David Prowse (voz: James Earl Jones)",
        "rol": "Sith redimido",
        "afiliacion": "Imperio Galáctico / Jedi"
      },
      {
        "nombre": "Emperador Palpatine",
        "actor": "Ian McDiarmid",
        "rol": "Emperador del Imperio Galáctico",
        "afiliacion": "Sith / Imperio"
      }
    ],
    "planeta_principal": "Endor",
    "recaudacion_mundial_millones": 475,
    "distribuidora": "20th Century Fox"
  }
]
 

);
use('cine');
db.cine.find()

// 3.Películas dirigidas por George Lucas
use('cine');
db.cine.find({ director: "George Lucas" })

// 4.Película cuyo episodio es el 6
use('cine');
db.cine.findOne({ episodio: 6 })

// 5.Primera película en la que aparece el personaje "Yoda"
use('cine');
db.cine.find({ "personajes.nombre": "Yoda" }).sort({ estreno: 1 }).limit(1)

// 6.Películas donde aparece "Darth Vader" como personaje
use('cine');
db.cine.find({ "personajes.nombre": "Darth Vader" })


// 7.Títulos de películas con recaudación mayor a 500 millones
use('cine');
db.cine.find(
  { recaudacion_mundial_millones: { $gt: 500 } },
  { _id: 0, titulo: 1 }
)

// 8. Películas donde el planeta principal sea "Tatooine" o "Hoth"
use('cine');
db.cine.find({ planeta_principal: { $in: ["Tatooine", "Hoth"] } })

// 9.Películas cuya sinopsis contiene la palabra "Jedi"
use('cine');
db.cine.find({ sinopsis: /Jedi/i })


// 10.Título y lista de nombres de personajes
use('cine');
db.cine.aggregate([
  { $unwind: "$personajes" }
])


// 11.1
// Número total de personajes por película
use('cine');
db.cine.aggregate([
  {
    $project: {
      titulo: 1,
      total_personajes: { $size: "$personajes" }
    }
  }
])

//11.2
// Total recaudado por películas de más de 125 minutos
use('cine');
db.cine.aggregate([
  { $match: { duracion_minutos: { $gt: 125 } } },
  {
    $group: {
      _id: null,
      total_recaudacion: { $sum: "$recaudacion_mundial_millones" }
    }
  }
])

//11.3
// Lista de actores únicos 
use('cine');

db.cine.aggregate([
  { $unwind: "$personajes" },
  {
    $group: {
      _id: "$personajes.actor"
    }
  }
])

//12. Uso de JS

use('cine');

let total = 0;

db.cine.find().forEach(p => {
  print("Título: " + p.titulo);
  print("Director: " + p.director);
  print("Productor: " + p.productor.join(", "));
  print("Número de personajes: " + p.personajes.length);
  print("Personajes:");
  p.personajes.forEach(personaje => print("  - " + personaje.nombre));
  print("Recaudación mundial: $" + p.recaudacion_mundial_millones + " millones");
  print("--------------------------------------------------------");
  total += p.recaudacion_mundial_millones;
});

print("TOTAL RECAUDACIÓN MUNDIAL: $" + total + " millones");

