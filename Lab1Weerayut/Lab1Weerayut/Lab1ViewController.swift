import UIKit
class Lab1ViewController: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var showDataLabel: UILabel!
    @IBOutlet weak var intputDataTextField: UITextField!
    @IBOutlet weak var myButton: UIButton!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.intputDataTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func showDataButton(_ sender: Any) {
        showDataLabel.text = intputDataTextField.text
        intputDataTextField.text = ""
        intputDataTextField.isHidden = true
        myButton.isHidden = true
        myImageView.isHidden = false
    }
}

