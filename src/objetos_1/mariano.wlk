import golosinas.*
object mariano {

	// para este objeto no damos pistas
	// definimos algunos métodos para que compile el test
	var bolsa = #{}
	//var gustos = []

	method comprar(golosina) {
		bolsa.add(golosina)
		//gustos.add(#{golosina.gusto()})
	}
	
	method mostrar()= bolsa
	method desechar(golosina) {
		bolsa.remove( golosina )
	}

	method probarGolosinas() {
		bolsa.forEach{ golosina => golosina.mordisco()}
	}

	method hayGolosinasSinTacc() {
		return bolsa.any{ golosina => golosina.libreGluten() }
	}

	method preciosCuidados() {
		return (bolsa.all{ golosina => golosina.precio() } <= 10)
	}

	method golosinaDeSabor(sabor) {
		return bolsa.find{ golosina => golosina.gusto() == sabor }
	}

	method golosinasDeSabor(sabor) {
		return bolsa.filter{ golosina => golosina.gusto() == sabor }
	}
	method sabores (){
		return bolsa.map{ golosina => golosina.gusto() }
		//return gustos
	}
	method golosinaMasCara(){
		return bolsa.max{golosina => golosina.precio()}
	}
	method pesoGolosinas(){
		return bolsa.sum{golosina=> golosina.peso()}
		}
}

