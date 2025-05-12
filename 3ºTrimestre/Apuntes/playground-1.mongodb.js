use("agenda");
db.fiestas.insertMany(
    [{
        "organizador": "Bam-Bam Mármol",
        "fiesta": {
            "tipo": "Infantil",
            "fecha": "27/06/2022",
            "hora": "10:00"
        },
        "invitados": [{
            "nombre": "Pedro Picapiedra",
            "tlf": "913334455"
        }, {
            "nombre": "Pablo Mármol",
            "tlf": "913334466"
        }, {
            "nombre": "Vilma Picapiedra",
            "tlf": "913334455"
        }, {
            "nombre": "Betty Mármol",
            "tlf": "913334466"
        }]
    },
    {
        "organizador": "Pedro Almodóvar",
        "fiesta": {
            "tipo": "Disfraces",
            "fecha": "27/06/2022",
            "hora": "10:00"
        },
        "invitados": [{
            "nombre": "Hugo Silva",
            "tlf": "913337788"
        }, {
            "nombre": "Paco León",
            "tlf": "913339999"
        }, {
            "nombre": "Alex de la Iglesia",
            "tlf": "913371112"
        }, {
            "nombre": "Rossy de Palma",
            "tlf": "913334422"
        }]
    }
]
)

use("agenda");
db.fiestas.find();


// Obtenemos los detalles de la fiesta de Bam-Bam Mármol
use("agenda");
db.fiestas.findOne({"organizador": "Bam-Bam Mármol"}).fiesta;

// Obtenemos los invitados a la fiesta de Bam-Bam Mármol
use("agenda");
db.fiestas.findOne({"organizador": "Bam-Bam Mármol"}).invitados;

// Obtenemos fiestas infantiles
use("agenda");
db.fiestas.find({"fiesta.tipo": "Infantil"});

// Obtenemos fiestas donde está invitado Paco León.
use("agenda");
db.fiestas.find({"invitados.nombre": "Paco León"});