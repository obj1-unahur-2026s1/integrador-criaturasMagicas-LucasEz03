import criaturas.*
import roles.*

class Colonia{
    const criaturas = []

    method atacar(unArea){
        if(self.poderOfeTotal() > unArea.poderDef()){
        unArea.serUsurpada(self)
        }else{
            criaturas.forEach({c=> c.perder15PorCiento()})
        }
    }
    method poderOfeTotal(){
        return criaturas.sum({c=> c.poderOfensivo()})
    }
    method cantCriaturasFormidables(){
        return criaturas.count({c=> c.esFormidable()})
    }
}

class Area{
    method poderDef()
    var colonia = new Colonia()
    method serUsurpada(unaColonia){
        colonia = unaColonia
    }
}

class Claro inherits Area{
    
    override method poderDef(){
        return 100 + colonia.poderOfeTotal()
    }
}

class Castillo inherits Area{
    override method poderDef(){
        return 200 * (colonia.cantCriaturasFormidables())
    }
}
