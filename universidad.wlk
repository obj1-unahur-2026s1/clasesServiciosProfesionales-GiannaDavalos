class Universidad {
  var property provincia
  var property honorariosRecomendados
  var totalDonaciones = 0

  method recibirDonacion(monto){
    totalDonaciones += monto
  }  
  
  method totalDonaciones() = totalDonaciones
}