object asociacionLitoral {
  var totalRecaudado = 0

  method recibirFondos(monto){
    totalRecaudado += monto
  }

  method totalRecaudado() = totalRecaudado
}