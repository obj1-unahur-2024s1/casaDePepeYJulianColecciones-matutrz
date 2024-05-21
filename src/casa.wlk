import cosas.* //obviamente, vamos a usar los objetos del archivo cosas ;-)

object casaDePepeYJulian {
	const cosas = []
	
	var cuentaBancaria = cuentaCorriente
	
	method comprar(cosa) {
		cosas.add(cosa)
		self.gastar(cosa.precio())
		}
	
	
	method cantidadDeCosasCompradas() {
		return cosas.size()
		}
	
	
	method tieneComida() {
		return cosas.any({c => c.esComida()})
		}
	
	
	method vieneDeEquiparse() {
		return cosas.last().esComida() or cosas.last().precio() > 50000
		}
		
	method esDerrochona() {
		return cosas.sum({c => c.precio()}) > 90000
	}
	
	method compraMasCara() {
		return cosas.max({c => c.precio()})
	}
	
	method electrodomesticosComprados() {
		return cosas.map({c => c.esElectrodomestico()})
	}
	
	method malaEpoca() {
		return not cosas.any({c => c.esElectrodomestico()})
	}
	
	method queFaltaComprar(lista){
		cosas.asSet().difference(lista)
	}
	
	method faltaComida(){
		var totalComida = 0
		
		totalComida = cosas.count({c => c.esComida()})
		return totalComida > 2
	}
	
	method setCuentaBancaria(nuevaCuentaBancaria) {
		cuentaBancaria = nuevaCuentaBancaria
	}
	
	method gastar(importe) {
		cuentaBancaria.extraer(importe)
	}
	
	method dineroDisponible() = cuentaBancaria.saldo()
}

object cuentaCorriente {
	var saldo = 0
	
	method saldo() = saldo
	
	method depositar(cantidad) {
		saldo = saldo + cantidad
	}
	
	method extraer(cantidad) {
		saldo = 0.max(saldo - cantidad)
	}
}

object cuentaConGastos {
	var saldo = 0
	
	method saldo() = saldo
	
	method depositar(cantidad) {
		saldo = (saldo + cantidad) - 200 
	}
	
	method extraer(cantidad) {
		if (cantidad <= 10000) saldo = saldo - (cantidad + 200)
			else saldo = saldo - cantidad * 0.02 
	}
}


object cuentaCombinada {
	var cuentaPrimaria = cuentaCorriente
	var cuentaSecundaria = cuentaConGastos
	
	var saldoTotal = cuentaPrimaria.saldo() + cuentaSecundaria.saldo()
	
	method setCuentaPrimaria(cuenta) {
		cuentaPrimaria = cuenta
	}
	
	method setCuentaSecundaria(cuenta) {
		cuentaSecundaria = cuenta
	}
	
	method saldoCuentaPrimaria() = cuentaPrimaria.saldo()
	
	method saldoCuentaSecundaria() = cuentaSecundaria.saldo()
	
	method saldoTotal() = saldoTotal
	
	method depositar(cantidad) = cuentaPrimaria.depositar(cantidad)
	
	method extraer(cantidad){
		if (cantidad < cuentaPrimaria.saldo()) {
			cuentaPrimaria.extraer(cantidad)
		}
		else {
			var saldoRestante = cantidad - cuentaPrimaria.saldo() 
			cuentaPrimaria.extraer(cantidad)
			cuentaSecundaria.extraer(saldoRestante)
		}
	}
}