object bombon {
	var peso = 15
	
	method precio() =  5 
	method peso() = peso 
	method mordisco() { peso = (peso * 0.8 - 1).max(0)} 
	method gusto() =frutilla 
	method libreGluten() = true 
}

object alfajor {
	var property peso = 300
	method precio() = 12 
	method peso() = peso 
	method mordisco() {peso = (peso * 0.8).max(0)} 
	method gusto() =chocolate 
	method libreGluten() = false 
}

object caramelo {
	var property peso = 7
	method precio() = 2 
	method peso() = peso 
	method mordisco() { if (not peso<2)peso -=( peso*0.9).max(0) }
	method gusto() = naranja 
	method libreGluten() = true 
}

object chupetin {
	var property peso = 5
	method precio() = 1 
	method peso() = peso 
	method mordisco() { peso -=( 1).max(0) }
	method gusto() = frutilla 
	method libreGluten() = true 
}

object oblea {
	var property peso = 250
	method precio() = 5 
	method peso() = peso 
	method mordisco() { if (peso>70) peso -= (peso*0.5).max(0) else peso-=(peso*0.75).max(0)}
	method gusto() = vainilla 
	method libreGluten() = false 
}

object chocolatin {
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var pesoInicial
	var pesoActual
	
	/* al principio, el peso actual coincide con el inicial */
	method pesoInicial(cuanto) { 
		pesoInicial = cuanto
		pesoActual = cuanto
	}
	method gusto() = chocolate 
	method libreGluten() = false 
	method mordisco() { pesoActual -=( 2).max(0) }
	method precio() = pesoInicial*0.50 
}

object golosinaBaniada {
	var golosinaInterior
	var pesoBanio = 4
	
	method baniaA(unaGolosina) { golosinaInterior = unaGolosina }
	method precio() = golosinaInterior.precio()+2 
	method peso() = golosinaInterior.peso()+pesoBanio 
	method mordisco() {
		golosinaInterior.mordisco()
		if (pesoBanio > 0) { pesoBanio -=( 2).max(0) }
		// otra forma de hacer la cuenta: pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method gusto() = golosinaInterior.gusto() 
	method libreGluten() = golosinaInterior.libreGluten()	
}

object tuttifrutti {
	var mordiscos = 0
	var property libreGluten = true
	var property peso = 5
	method precio() {if (libreGluten)return 7 else return 10 }
	method peso() = peso 
	method mordisco() {
		(mordiscos += 1).max(4)
		peso-=(1.25).max(0)
	}
	method gusto() { 
		if (mordiscos==0) return frutilla
		if (mordiscos==1) return chocolate
		if (mordiscos==2) return naranja
		else return frutilla
	}
	
}
object frutilla {}
object chocolate {}
object naranja {}
object vainilla {}