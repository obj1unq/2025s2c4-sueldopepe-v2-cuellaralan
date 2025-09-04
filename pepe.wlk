object pepe {
  var property bonoResultados = bonoNulo
  var property bonoPresentismo = bonoNulo
  var property categoria = cadete
  var property ausencias = 0
  
  method sueldo() = (categoria.neto() + bonoResultados.bono(
    self
  )) + bonoPresentismo.bono(self)
}

object sofia {
  var property bonoResultados = bonoNulo
  var property categoria = cadete
  var property ausencias = 0
  const plusNeto = 1.3
  
  method sueldo() = (categoria.neto() * plusNeto) + bonoResultados.bono(self)
}

object roque {
  //no se aclara si el neto de roque puede variar, se toma como assumption que es posible
  var property neto = 28000
  var property bonoResultados = bonoNulo
  
  method sueldo() = neto + bonoResultados.bono(self)
}

object ernesto {
  var property compañero = pepe
  var property bonoPresentismo = bonoNulo
  const ausencias = 0
  
  method sueldo() = compañero.neto() + bonoPresentismo.bono(self)
}

object gerente {
  //gerentes que ganan $15.000
  //cadetes cuyo neto es $20.000
  //puede haber más categorías.
  method neto() = 15000
}

object cadete {
  //gerentes que ganan $15.000
  //cadetes cuyo neto es $20.000
  //puede haber más categorías.
  method neto() = 20000
}

object vendedor {
  //gerentes que ganan $15.000
  //cadetes cuyo neto es $20.000
  //puede haber más categorías.
  var aumentoPorVentas = 1
  
  method neto() = 16000 * aumentoPorVentas
  
  method activarAumentoPorMuchasVentas() {
    aumentoPorVentas = 1.25
  }
  
  method desactivarAumentoPorMuchasVentas() {
    aumentoPorVentas = 1
  }
}

object medioTiempo {
  //modificador de categorias, indica que el neto es 0,5
  var property categoriaBase = cadete
  
  method neto() = categoriaBase.neto() * 0.5
}

object bonoPorcentaje {
  //se puede enviar/recibir 
  method bono(empleado) = empleado.categoria().neto() * 0.1
}

object bonoFijo {
  method bono(empleado) = 800
}

object bonoNulo {
  method bono(empleado) = 0
}

object bonoNormal {
  method bono(empleado) {
    if (empleado.ausencias() == 0) {
      return 2000
    } else {
      if (empleado.ausencias() == 1) {
        return 1000
      } else {
        return 0
      }
    }
  }
}

object bonoAjuste {
  method bono(empleado) = if (empleado.ausencias() == 0) 100 else 0
}

object bonoDemagocico {
  method bono(empleado) = if (empleado.categoria().neto() > 18000) 500 else 300
}