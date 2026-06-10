import asociacionDelLitoral.*

class ProfesionalVinculado{
    var property universidad

    method honorarios() = universidad.honorariosRecomendados()
    method provinciasDondePuedeTrabajar() = #{universidad.provincia()}
    
    method cobrar(monto) {
        universidad.recibirDonacion( monto / 2)
    }
}

class ProfesionalAsociado {
    var property universidad

    method honorarios() = 3000
    method provinciasDondePuedeTrabajar() = #{"Entre Ríos", "Santa Fe", "Corrientes"}
    
    method cobrar(monto) {
        asociacionLitoral.recibirFondos(monto)
    }
}

class ProfesionalLibre {
    var property universidad
    var property honorarios
    var property provinciasDondePuedeTrabajar = #{}
    var totalRecaudado = 0

    method totalRecaudado() = totalRecaudado

    method cobrar(monto) {
        totalRecaudado += monto
    }

    method pasarDinero(aQuien, monto) {
        if (totalRecaudado < monto) {
            self.error("No tengo fondos suficientes")
        }
        totalRecaudado -= monto
        aQuien.cobrar(monto)
    }
}