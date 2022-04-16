

import UIKit

struct Brain {
    
    var bmi: BMI?
    var bmr: BMR?
    let pal = [1.53, 1.76, 2.25] 
    
    func getBMIValue() -> String {
        let result = String(format: "%.1f", bmi?.valueBMI ?? 0.0)
        return result
    }
    
    func getBMRValue() -> String {
        let result = String(format: "%.2f", bmr?.valueBMR ?? 0.0)
        return result
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(valueBMI: bmiValue, adviceBMI: "Eat More! Take care of yourself! Your BMI is ", color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(valueBMI: bmiValue, adviceBMI: "You're in good condition! Your BMI is ", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        } else {
            bmi = BMI(valueBMI: bmiValue, adviceBMI: "Eat less! You're in serious trouble! Your BMI is ", color: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1))
        }
        
    }
    
    mutating func calculateBMR(height: Float, weight: Float, age: Float, gender: Int, activity: Double) {
        let height = height * 100
        let activityFactor = Float(activity)

        if gender == 0 {
            let bmrValue = (10 * weight + 6.25 * height - 5 * age + 5) * activityFactor
            bmr = BMR(valueBMR: bmrValue)
        } else if gender == 1 {
            let bmrValue = (10 * weight + 6.25 * height - 5 * age - 161) * activityFactor
            bmr = BMR(valueBMR: bmrValue)
        } else {
            let bmrValue = 0.0
            bmr = BMR(valueBMR: Float(bmrValue))
        }
    }
    

    func getBMIAdvice() -> String {
        return bmi?.adviceBMI ?? "0.0"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
        
}
