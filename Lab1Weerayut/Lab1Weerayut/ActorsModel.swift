import Foundation
class ActorsModel {
    
    let name:String!
    let country:String!
    let height:String!
    let imageStr:String!
    
    init(name:String,country:String,height:String,img:String) {
        self.name = name
        self.country = country
        self.height = height
        self.imageStr = img
    }
    
    
}

struct Actors2Model {
    
    let name:String!
    let country:String!
     let height:String!
    let imageStr:String!
    
    init(name:String,country:String,height:String,img:String) {
        self.name = name
        self.country = country
        self.height = height
        self.imageStr = img
    }
}
