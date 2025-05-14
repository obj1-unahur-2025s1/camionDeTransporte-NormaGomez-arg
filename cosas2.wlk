object knightRider {
    
    method peso() = 500

    method nivelDePeligro() = 10

    method cantidadDeBultos() = 1

    method consecuenciaDeCarga() {}
}

object bumblebee {

    var esUnRobot = true
  
  method peso() = 800

  method nivelDePeligro() {
        return
            if(esUnRobot) {
                30
            }
            else 15
    }

    method transformarse() {
        esUnRobot = not esUnRobot
    }

    method cantidadDeBultos() = 2

    method consecuenciaDeCarga() {
        self.transformarse()
    }
}

object paqueteDeLadrillos {

    var cantidadDeLadrillos = 1

    method cantidadDeLadrillos() = cantidadDeLadrillos

    method peso() = cantidadDeLadrillos * 2

    method nivelDePeligro() = 2

    method cantidadDeLadrillos(cantidad) {
        cantidadDeLadrillos = cantidad
    }

    method cantidadDeBultos() = if (cantidadDeLadrillos<101) 1 else if (cantidadDeLadrillos.between(101, 300)) 2 else 3

    method consecuenciaDeCarga() {
        cantidadDeLadrillos = cantidadDeLadrillos + 12
    }
}

object arenaGranel {

    var peso = 10

    method peso() = peso

    method nivelDePeligro() = 1

    method peso(pesoNuevo) {
        peso= pesoNuevo
    }

    method cantidadDeBultos() = 1

    method consecuenciaDeCarga() {
        peso = peso - 10
    }

}

object bateriaAntiarea {
  
  var tieneMisiles = false

  method peso() = if (tieneMisiles) 300 else 200

  method nivelDePeligro() = if (tieneMisiles) 100 else 0

  method cambiarMisiles() {
    tieneMisiles = not tieneMisiles
  }

  method cantidadDeBultos() = if (tieneMisiles) 2 else 1

  method consecuenciaDeCarga() {
    self.cambiarMisiles()
  }
}

object contenedor {

    const cosas = []
    const peso = 100

    method peso() = peso + cosas.sum({c=>c.peso()})

    method nivelDePeligro() {
        return
            if(cosas.isEmpty()) {
                0
            }
            else {
                cosas.max({c=>c.nivelDePeligro()}).nivelDePeligro()
            }
    }

    method cargarCosa(cosa) {
        cosas.add(cosa)
    }

    method cantidadDeBultos() {
        return
            1 + cosas.sum({c=>c.cantidadDeBultos()})
    }

    method consecuenciaDeCarga() {
        cosas.forEach({c=>c.consecuenciaDeCarga()})
    }
}

object residuos {
    var peso = 10

    method peso() = peso

    method nivelDePeligro() = 200

    method peso(pesoNuevo) {
        peso= pesoNuevo
    }

    method cantidadDeBultos() = 1

    method consecuenciaDeCarga() {
        peso = peso + 15
    }
}

object embalaje {
    var cosaEnvuelta = residuos

    method peso() = cosaEnvuelta.peso() 

    method nivelDePeligro() = cosaEnvuelta.nivelDePeligro() / 2

    method envolverOtraCosa(cosaNueva) {
        cosaEnvuelta = cosaNueva
    }

    method cantidadDeBultos() = 2

    method consecuenciaDeCarga() {}

}