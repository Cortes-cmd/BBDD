use('facturas');

db.facturas.insertOne({
	"numero": 1000,
	"fecha": "30-04-2019",
	"cliente": {
		"nif": "516667788A",
		"nombre": "Pepe Sánchez",
		"tlf": "61777888"
	}
})
db.detalles.insertOne({
	"numero": 1000,
	"detalle": [{
		"producto": "Impresora Láser",
		"precio": 85,
		"cantidad": 2
	}, {
		"producto": "CPU",
		"precio": 480,
		"cantidad": 1
	}, {
		"producto": "Disco duro portatil",
		"precio": 53,
		"cantidad": 2
	}]
})

use('facturas');
db.detalles.insertOne({
	"numero": 1001,
	"detalle": [{
		"producto": "Impresora de tinta",
		"precio": 45,
		"cantidad": 3
	}, {
		"producto": "Caja de 100 CDs",
		"precio": 12,
		"cantidad": 2
	}, {
		"producto": "Disco duro portatil",
		"precio": 51,
		"cantidad": 1
	}]
})

use ('facturas');
db.facturas.insertOne({
	"numero": 1001,
	"fecha": "01-05-2019",
	"cliente": {
		"nif": "61777888J",
		"nombre": "Juan López",
		"tlf": "677888999"
	}
})

use ('facturas');
db.facturas.find();

use ('facturas');
let f = db.facturas.findOne({'cliente.nombre':'Juan López'});
console.log('Numero: '+ f.numero);
console.log('Cliente: '+ f.cliente.nombre);
let ventas = db.detalles.findOne({'numero' : f.numero});

for (let v of ventas.detalle){
    console.log(v.producto);
};

use('facturas');