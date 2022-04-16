
import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var adviceBMI: String?
    var color: UIColor?
    var bmrValue: String?
    
    @IBOutlet weak var bmiResultLabel: UILabel!
    @IBOutlet weak var bmrResultLabel: UILabel!
    
    @IBOutlet weak var recalculationButtonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bmiResultLabel.text = adviceBMI! + bmiValue!
        bmrResultLabel.text = "You should consume a \(bmrValue!) calories per day to maintain your weight!"
        view.backgroundColor = color
        
        recalculationButtonOutlet.layer.cornerRadius = 8
    }
    
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

