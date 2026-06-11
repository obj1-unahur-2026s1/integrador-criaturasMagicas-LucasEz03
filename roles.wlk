import criaturas.*
import areas.*
object guardian{
    method extra() = 100
    method esExtraordinario(criatura){
        return criatura.poderMag() > 50
    }
    method siguienteRol(){
        return new Domador(mascota= [new Mascota( edad=1, tieneCuernos=false)])
    }
}

object hechicero{
    method extra()= 0
    method esExtraordinario(criatura){
        return true
    }
    method siguienteRol()= guardian
}

class Domador{
    const mascota = []
    method cantMascotas(){mascota.size()}
    method extra() = 150 * (mascota.count({m=> m.tieneCuernos()}))
    method alMenosUnaConCuerno()= mascota.any({m=> m.tieneCuernos()})
    method esExtraordinario(criatura){
        return criatura.poderMag() >= 15 and mascota.all({m=> m.esVeterana()})
    }    
    method agregarMascota(unaMascota){mascota.add(unaMascota)}
    method quitarMascota(unaMascota){mascota.remove(unaMascota)}
    method siguienteRol(){
        if(!self.alMenosUnaConCuerno()){
            self.error("No se puede cambiar de rol")
        }else{
            return hechicero
        }
    }
}