import roles.*

class Criatura{
    var rol 
    var poderMag
    const astucia
    method poderMag() = poderMag
    method poderOfensivo(){
        return (poderMag * 10) + rol.extra()
    }
    method esAstuta()
    method esExtraordinaria()= rol.esExtraordinario(self)
    method esFormidable(){
        return self.esAstuta() or self.esExtraordinaria()
    }
    method cambiarDeRol(){
        rol = rol.siguienteRol()
    }
    method perder15PorCiento(){
        poderMag = poderMag * 0.85
    }
}

class Hada inherits Criatura{
    var kmQueVuela = 2
    method aumentarKm(unValor){
        kmQueVuela = (kmQueVuela + unValor).min(25)
    }   
    method kmQueVuela()= kmQueVuela
    override method esAstuta(){
        return astucia > 50
    }
    override method esExtraordinaria(){
        return super() && kmQueVuela > 10
    }
}

class Duende inherits Criatura{

    override method poderOfensivo(){
        return super() * 1.1
    } 
    override method esAstuta()= false
}
class Mascota{
    var property tieneCuernos = false
    var edad
    method esVeterana()= edad >= 10
}

