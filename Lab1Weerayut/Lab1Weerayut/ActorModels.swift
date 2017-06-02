
import Foundation

class ActorModel{
    
    let name:String!
    let country:String!
    let height:String!
    let imageStr:String!
    let spouse:String!
    
    
    init(name:String , country:String , height:String, img:String, spouse:String){
        self.name = name
        self.country = country
        self.height = height
        self.imageStr = img
        self.spouse = spouse
        
    }
    
}

