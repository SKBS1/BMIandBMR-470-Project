

import UIKit

class InitialViewController: UIViewController {
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var genderSegmentController: UISegmentedControl!
    @IBOutlet weak var activitySegmentController: UISegmentedControl!

    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var calculationButtonOutlet: UIButton!
    
    
    var brain = Brain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        perform(#selector(showGreetingScreen), with: nil, afterDelay: 0)
        
        
        setInitialValue()
        
        calculationButtonOutlet.layer.cornerRadius = 8
    }
    
    @objc func showGreetingScreen() {
        performSegue(withIdentifier: "GreetingSegue", sender: nil)
    }
    
    @IBAction func ageSliderTapped(_ sender: UISlider) {
        let age = String(format: "%.0f", sender.value)
        ageLabel.text = "\(age) years"
    }
    
    @IBAction func weightSliderTapped(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight) Kg"
    }
    
    @IBAction func heightSliderTapped(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height) m"
    }
    
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let weight = weightSlider.value
        let height = heightSlider.value
        let age = ageSlider.value
        let gender = genderSegmentController.selectedSegmentIndex
        let activity = brain.pal[activitySegmentController.selectedSegmentIndex]
        
        brain.calculateBMI(height: height, weight: weight)
        brain.calculateBMR(height: height, weight: weight, age: age, gender: gender, activity: activity)
        
        performSegue(withIdentifier: "ShowResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowResult" {
            let destination = segue.destination as! ResultViewController
            destination.bmiValue = brain.getBMIValue()
            destination.adviceBMI = brain.getBMIAdvice()
            destination.color = brain.getColor()
            destination.bmrValue = brain.getBMRValue()
        }
    }
    
    
    // Initial values
    func setInitialValue() {
        ageSlider.value = 30.0
        weightSlider.value = 76.0
        heightSlider.value = 1.85
    }
    
    
}

