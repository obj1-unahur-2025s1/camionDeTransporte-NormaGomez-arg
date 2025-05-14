import camion.*

object knightRiders {
    method peso() = 500
    method peligrosidad() = 10
}
object bumblebee {
    var forma = "auto"
    method forma() = forma
    method peso() = 800
    method peligrosidad() {
    if (forma == "auto") {
        return 15
    } else {
        return 30
    }
}
    method seTransformaEnRobot() {
        forma = "robot"
    }

    method seTransformaEnAuto() {
        forma = "auto"
    }
}
object paqueteDeLadrillos {
    const pesoUnLadrillo = 2
    var cantidadDeLadrillos = 0
    method cantidadDeLadrillos(unaCantidad) = cantidadDeLadrillos + unaCantidad
    method peso(unaCantidad) = self.cantidadDeLadrillos(unaCantidad) * pesoUnLadrillo
    method peligrosidad() = 2
}

object arenaGranel {
    var pesoActual = 0

    method peso() = pesoActual
    method peligrosidad() = 1

    method setPeso(nuevoPeso) {
        pesoActual = nuevoPeso
    }
}
object bateriaAntiaerea {
  
  var tieneMisiles = false

  method peso() = if (tieneMisiles) 300 else 200

  method nivelDePeligro() = if (tieneMisiles) 100 else 0

  method cambiarMisiles() {
    tieneMisiles = not tieneMisiles
  }
}

object contenedorPortuario {
  var cosasAdentro = [arenaGranel]
  method agregarCosas(unaCosa) = cosasAdentro.add(unaCosa)
  method sacarCosa(unaCosa) = cosasAdentro.remove(unaCosa)
  method peso() = 100 + cosasAdentro.sum({x=> x.peso()})
  method peligrosidad() = cosasAdentro.max({x => x.peligrosidad()})
}  
object residuosRadiactivos {
  var peso = 0
  method peso(nuevoPeso) {
    peso = nuevoPeso
  }
  method peligrosidad() = 200
}


object embalaje {
    var cosaEnvuelta = residuos

    method peso() = cosaEnvuelta.peso()

    method nivelDePeligro() = cosaEnvuelta.nivelDePeligro() / 2

    method envolverOtraCosa(cosaNueva) {
        cosaEnvuelta = cosaNueva
    }

}
