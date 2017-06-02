
import UIKit
class AddPersonViewController: UIViewController {
    @IBOutlet weak var inputNameTextField: UITextField!
    @IBOutlet weak var inputIdTextField: UITextField!
    @IBOutlet weak var rtarfSwitch: UISwitch!
    @IBOutlet weak var rtarfLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
            }
   
    override func viewWillAppear(_ animated: Bool) {
        
    }
    @IBAction func tappedSwitch(_ sender: Any) {
        if  rtarfSwitch.isOn {
            rtarfLabel.text = "IN RTARF"
            rtarfLabel.textColor = UIColor.green
            rtarfSwitch.onTintColor = UIColor.green
        }else{
            rtarfLabel.text = "OUT RTARF"
            rtarfLabel.textColor = UIColor.red
            rtarfSwitch.tintColor = UIColor.red
        }
        
            }
    
    @IBAction func saveDataButton(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let member = Member(context: context)
        member.id = inputIdTextField.text!
        member.name = inputNameTextField.text!
        member.isRTARF = rtarfSwitch.isOn
        
        // save data to coreDATA
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
        
    }
   }














