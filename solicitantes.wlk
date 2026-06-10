class Persona {
    var property provincia

    method puedeSerAtendidoPor(profesional) {
        return profesional.provinciasDondePuedeTrabajar().contains(provincia)
    }
}

class Institucion {
    var property universidadesReconocidas = #{}

    method puedeSerAtendidoPor(profesional) {
        return universidadesReconocidas.contains(profesional.universidad())
    }
}

class Club {
    var property provinciasDondeEsta = #{}

    method puedeSerAtendidoPor(profesional) {
        return provinciasDondeEsta.any({ prov => profesional.provinciasDondePuedeTrabajar().contains(prov) })
    }
}