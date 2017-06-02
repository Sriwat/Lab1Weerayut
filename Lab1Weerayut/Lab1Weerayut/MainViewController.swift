
import UIKit

class MainViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    
    
    
    @IBOutlet weak var tableview: UITableView!

    
    //var members = [Member]()
    var members:[Member] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableview.reloadData()
    }
    
    
    
    // 1. create Section in Tableview
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    // 2. create Row in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPerson" , for:indexPath)
        let member = members[indexPath.row]
        
        // Filter Rtarf - nom Rtarf
        if member.isRTARF{
             cell.textLabel?.text = "✅Name: \(member.name!)"
        }
        else{
             cell.textLabel?.text = "🅾️Name: \(member.name!)"
        }
        
        
       
        cell.detailTextLabel?.text = "Idenfity : \(member.id!)"
        return cell
    }
    
    
    
    
    
    
    // get Data Function
    func getData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            members = try context.fetch(Member.fetchRequest())
        }
        catch {
            print("Error Fetch Data!!!")
        }
        
    }
    
    // Delete Data record
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete{
            let member = members[indexPath.row]
            context.delete(member)
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                members = try context.fetch(Member.fetchRequest())
            }
            catch {
                print("Error Fetch Data!!!")
            }
            
            tableView.reloadData()

            
        }
    }
    

}
