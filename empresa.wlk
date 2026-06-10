class Empresa {
    var property profesionalescontratados = #{}
    var property honorarioReferencia
    var property clientes = #{} // Etapa 4

    // Etapa 1
    method cuantosEstudiaronEn(unaUniversidad) {
        return profesionalescontratados.count({ prof => prof.universidad() == unaUniversidad })
    }

    method profesionalesCaros() {
        return profesionalescontratados.filter({ prof => prof.honorarios() > honorarioReferencia })
    }

    method universidadesFormadoras() {
        return profesionalescontratados.map({ prof => prof.universidad() }).asSet()
    }

    method profesionalMasBarato() {
        return profesionalescontratados.min({ prof => prof.honorarios() })
    }

    method esDeGenteAcotada() {
        return profesionalescontratados.all({ prof => prof.provinciasDondePuedeTrabajar().size() <= 3 })
    }

    // Etapa 2
    method puedeSatisfacer(solicitante) {
        return profesionalescontratados.any({ prof => solicitante.puedeSerAtendidoPor(prof) })
    }

    // Etapa 4
    method darServicio(solicitante) {
        if (not self.puedeSatisfacer(solicitante)) {
            self.error("La empresa no puede atender a este solicitante")
        }
        
        // Buscamos los profesionales que lo pueden atender
        var profesionalesHabilitados = profesionalescontratados.filter({ prof => solicitante.puedeSerAtendidoPor(prof) })
        // Elegimos uno cualquiera (el primero de la lista/conjunto filtrado)
        var profesionalElegido = profesionalesHabilitados.anyOne()
        
        profesionalElegido.cobrar(profesionalElegido.honorarios())
        clientes.add(solicitante)
    }

    method cantidadDeClientes() = clientes.size()
    method tieneComoCliente(solicitante) = clientes.contains(solicitante)

    // Desafío Final
    method esPocoAtractivo(unProfesional) {
        return unProfesional.provinciasDondePuedeTrabajar().all({ prov => 
            profesionalescontratados.any({ otro => 
                otro != unProfesional 
                && otro.provinciasDondePuedeTrabajar().contains(prov) 
                && otro.honorarios() < unProfesional.honorarios() 
            })
        })
    }
}