object camion {
    const carga = []
    const tara = 1000

    method peso() = tara + self.pesoDeLaCarga()

    method pesoDeLaCarga() {
        return
            carga.sum({c=>c.peso()})
    }

    method cargarUnaCosa(cosa) {
        cosa.consecuenciaDeCarga()
        carga.add(cosa)
    }

    method descargarUnaCosa(cosa) { //Se asume que "cosa" esta en la carga del camion
        carga.remove(cosa)
    }

    method elPesoDeLasCargasEsPar() {
        return
            carga.all({c=>c.peso().even()})
    }

    method hayCosaConPeso(peso) {
        return
            carga.any({c=>c.peso() == peso})
    }

    method primerCosaConPeligro(peligro) {
        return
            carga.find({c=>c.nivelDePeligro() == peligro})
    }

    method cosasQueSuperanNivelDePeligro(peligro) {
        return
            carga.filter({c=>c.nivelDePeligro() > peligro})
    }

    method cosasQueSuperanPeligrosidadDeCosa(cosa) {
        return
            self.cosasQueSuperanNivelDePeligro(cosa.nivelDePeligro())
    }

    method estaExcedidoDePeso() {
        return
            self.peso() > 2500
    }

    method puedeCircularEnLaRutaConNivelDePeligro(peligro) {
        return
            not self.estaExcedidoDePeso() and
            self.cosasQueSuperanNivelDePeligro(peligro).size() == 0
    }

    method hayCosaConPesoEntre2Valores(valor1 , valor2) {
        return
            carga.any({c=>c.peso().between(valor1, valor2)})
    }

    method cosaMasPesada() {
        return
            carga.max({c=>c.peso()})
    }

    method totalDeBultos() {
      return
        carga.sum({c=>c.cantidadDeBultos()})
    }
}