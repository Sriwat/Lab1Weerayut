import UIKit
class JsonShowViewController: UIViewController{
    // 1 key-- URL
   var urlString = "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors"
  //  var urlString = "https://restcountries.eu/rest/v1/all"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadJsonWithURL()
        // self.downloadJsonWithTask()

    }
//--------------------URL 1 key
    func downloadJsonWithURL(){
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: (url as? URL )!, completionHandler: { (data, response, error) in
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                print(jsonObj!.value(forKey: "actors") as Any)
            }
        }) .resume()
    }

    
  //-------------Task
    func downloadJsonWithTask() {
        
        let url = NSURL(string: urlString)
        
        var downloadTask = URLRequest(url: (url as? URL)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20)
        
        downloadTask.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: downloadTask, completionHandler: {(data, response, error) -> Void in
            
            let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            
            print(jsonData!)
            
        }).resume()
    }
// ---------end download jason Task
    
    // --- create Table
    
    
    
    
}


