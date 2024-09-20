object gandalf {
  var vida = 100
  var armas = #{baculo, espadaGlamdring}

  method tieneArmas() = not armas.isEmpty()

  method sumatoriaPoderArmas() = armas.sum({ arma => arma.poder() })
  
  method poder() {
    if (vida >= 10) {
      return (vida * 15) + (self.sumatoriaPoderArmas() * 2)
    } else {
      return (vida * 300) + (self.sumatoriaPoderArmas() * 2)
    }
  }
  
  method vida() = vida
  
  method vida(_vida) {
    vida = _vida
  }

  method armas() = armas

  method armas(nuevasArmas) {
    armas = nuevasArmas
  } 

   method esTom()= false
}

object elfico {
  var poderOrigen = 30 // cambiamos el valor para resolver el punto de arsenal de la entrega 2
  
  //getter
  method poderOrigen() = poderOrigen
  
  //setter
  method poderOrigen(_poderOrigen) {
    poderOrigen = _poderOrigen
  }
}

object humano {
  var poderOrigen = 15
  
  //getter
  method poderOrigen() = poderOrigen
  
  //setter
  method poderOrigen(_poderOrigen) {
    poderOrigen = _poderOrigen
  }
}

object enano {
  var poderOrigen = 20
  
  //getter
  method poderOrigen() = poderOrigen
  
  //setter
  method poderOrigen(_poderOrigen) {
    poderOrigen = _poderOrigen
  }
}

object espadaGlamdring {
  var origen = elfico

  method origen(nuevoOrigen) {
    origen = nuevoOrigen
  }
  
  method poder() = origen.poderOrigen() * 10
}

object baculo {
  var poder = 400
  
  method poder() = poder
  
  method poder(_poder) {
    poder = _poder
  }
} //zonas

object lebennin {
  method puedePasar(personaje) = personaje.poder() > 1500
  
  method atravesar(personaje) {
    return personaje.vida()
  }
}

object minasTirith {

  method puedePasar(personaje) = personaje.tieneArmas()

  method atravesar(personaje) {
    if (self.puedePasar(personaje) && not(personaje.esTom())){
      personaje.vida(personaje.vida() - 10)
      return personaje.vida()
    }
     return personaje.vida()
  }
}

object lossarnach {
  method puedePasar(personaje) = true
  
  method atravesar(personaje) {
    if (self.puedePasar(personaje) && not(personaje.esTom())){
      personaje.vida(personaje.vida() + 1)
      return personaje.vida()
    }
     return personaje.vida()
  }
}

object gondor {

  var zonas = #{lebennin, minasTirith}

  method zonas(nuevasZonas) {
    zonas = nuevasZonas
  }

  method puedePasar(personaje) {
    return zonas.all({ zona => zona.puedePasar(personaje)})
  }

  method atravesar(personaje) {
    if(self.puedePasar(personaje) && not(personaje.esTom())){
      zonas.map({ zona => zona.atravesar(personaje)})
      return personaje.vida()
    }
     return personaje.vida()
  }
  
}

object tom {
  var poder = 1600
  var vida = 100

  method tieneArmas() = true 
  
  method poder() = poder
  
  method poder(_poder) {
    poder = _poder
  }

   method esTom()=true

   method vida() = vida 

   method vida(_vida) {
    vida = _vida
  }
  

}

// para la segunda entrega 

class Espada {
  const multiplicador 
  const property origen
  

  method multiplicador() {
    if (multiplicador > 1){
      return multiplicador.min(20)
    } else 
    { return multiplicador.max(1)}
    
  }

  method poder() = origen.poderOrigen() * self.multiplicador()

}

class Daga inherits Espada {
  override method poder(){
    return super()/2
  }
}

class Arco {

  var property tension = 40
  const largo 

  method poder() = (tension * largo) / 10

}

class Hacha {
  const largoDelMango 
  const pesoDeLaHoja

  method poder() = largoDelMango * pesoDeLaHoja
}