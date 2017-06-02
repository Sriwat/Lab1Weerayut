import UIKit
class JsonUIViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    let urlString = "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors"

    @IBOutlet weak var tableView: UITableView!
    
     var actorsArray = [ActorModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadJsonWithURL()
        //self.downloadJsonWithTask()
    }
    
    
// Function DowLoad URL JSON
    func downloadJsonWithURL() {
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                print(jsonObj!.value(forKey: "actors")!)
                
                if let actorArray = jsonObj!.value(forKey: "actors") as? NSArray {
                    for actor in actorArray{
                        if let actorDict = actor as? NSDictionary {
                            
                            let nameStr: String = {
                                if let name = actorDict.value(forKey: "name") {
                                    return name as! String
                                }
                                return "dummy name"
                            }()
                            
                            let countryStr: String = {
                                
                                if let country = actorDict.value(forKey: "country") {
                                    return country  as! String
                                }
                                return "dummy country"
                            }()
                            let heightStr: String = {
                                if let height = actorDict.value(forKey: "height") {
                                    return height as! String
                                }
                                return "dummy height"
                            }()
                            
                            let imgStr: String = {
                                
                                if let img = actorDict.value(forKey: "image") {
                                    return img as! String
                                }
                                return "dummy image"
                            }()
                            
                            let spouseStr: String = {
                                if let spouse = actorDict.value(forKey: "spouse") {
                                    return spouse as! String
                                }
                                return "dummy spouse"
                            }()
                            
                            self.actorsArray.append(ActorModel(name: nameStr, country: countryStr, height:heightStr, img: imgStr, spouse:spouseStr))
                            
                            OperationQueue.main.addOperation({
                                self.tableView.reloadData()
                            })
                        }
                    }
                }
            }
        }).resume()
    }
    //--------------------------------------------------------
    
    func downloadJsonWithTask() {
        
        let url = NSURL(string: urlString)
        
        var downloadTask = URLRequest(url: (url as? URL)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20)
        
        downloadTask.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: downloadTask, completionHandler: {(data, response, error) -> Void in
            
            let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            
            print(jsonData!)
            
        }).resume()
    }
    // Create Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actorsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellActors") as! ActorTableViewCell
        
        let actor = actorsArray[indexPath.row]
        
        cell.nameLabel.text = actor.name
        cell.countryLabel.text = actor.country
        cell.heightLabel.text = actor.height
        cell.spouseLabel.text = actor.spouse
        
        
        let imgURL = NSURL(string: actor.imageStr)
        
        if imgURL != nil {
            let data = NSData(contentsOf: (imgURL as? URL)!)
            cell.imgView.image = UIImage(data: data as! Data)
        }
        
        return cell
    }
    

   //---------------------------------------------------
}
