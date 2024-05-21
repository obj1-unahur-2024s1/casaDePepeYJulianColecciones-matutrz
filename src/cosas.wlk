// Como ya sabemos crear objetos y definir algunos métodos simples, 
// algunos los tenemos parcialmente definidos. Completar todo los demás
// para satisfacer lo que pide el enunciado.

object heladera {
	method precio() { return 200000 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object cama {
	method precio() { return 80000 }
	method esComida() { return false }
	method esElectrodomestico() { return false }	
}

object tiraDeAsado {
	method precio() { return 3500 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object paqueteDeFideos {
	method precio() { return 500 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object plancha {
	method precio() { return 12000 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object kiloDeMilanesasRebosadas {
	method precio() { return 2600 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object botellaDeSalsaDeTomate {
	method precio() { return 900 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object microondas {
	method precio() { return 42000 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object kiloDeCebollas {
	method precio() { return 250 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object compu {
	method precio() { return 500 * dolar.precioDeVenta() }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object dolar {
	var precioDeVenta = 0
	
	method setPrecioDeVenta(nuevoPrecio) {
		precioDeVenta = nuevoPrecio
	}
	
	method precioDeVenta() = precioDeVenta
}

object packComida {
	var comida = kiloDeMilanesasRebosadas
	var aderezo = botellaDeSalsaDeTomate
	
	method setComida(comidaElegida){
		comida = comidaElegida
	}
	
	method comidaElegida() = comida
	
	method setAderezo(aderezoElegido){
		aderezo = aderezoElegido
	}
	
	method aderezoElegido() = aderezo
	
	method precio() { return comida.precio() + aderezo.precio() }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}