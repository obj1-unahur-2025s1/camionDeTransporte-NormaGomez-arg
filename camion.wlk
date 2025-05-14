import cosas.*

object camion {
    const tara = 1000
    method peso() = tara + carga.peso()
    method estaExcedido() = self.peso() > 2500
    method puedeCircularEnRuta(nivel) {
      return not self.estaExcedido() and not carga.alguienSuperaPeligrosidad(nivel)
    }  
}
object carga {
    var carga = [knightRiders, bumblebee]

    method cargar(unaCosa) =  carga.add(unaCosa)
    method descargar(unaCosa) = carga.remove(unaCosa)
    method peso() = carga.sum({c =>c.peso()}) 
    method pesosSonPares() = carga.all { unaCosa => unaCosa.peso() % 2 == 0 }
    method algoPesa(unPeso) = carga.any { p => p.peso() == unPeso }
    method listaPeligrosidad(nivel) = carga.filter({c=>c.peligrosidad() ==nivel})
    method primerCosaConPeligrosidad(nivel) = self.listaPeligrosidad(nivel).first()
    method alguienSuperaPeligrosidad(nivel) = carga.any({c=>c.peligrosidad() > nivel})
    method superaPeligrosidad(nivel) = carga.filter({c=>c.peligrosidad() > nivel})
    
    
}