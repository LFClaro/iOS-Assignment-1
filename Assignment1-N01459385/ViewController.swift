//
//  ViewController.swift
//  Assignment1-N01459385
//
//  Created by Luiz Fernando Reis on 2021-09-24.
//

import UIKit

class ViewController: UIViewController {
    var myCalc : Calculator = Calculator()
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var historyButtontext: UIButton!
    @IBOutlet weak var historyPane: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyPane.isHidden = true
    }
    
    // Changing the text in History Button
    let simpleButton = NSMutableAttributedString(string: "Standard - No History", attributes: [
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30),
        NSAttributedString.Key.foregroundColor: UIColor.white
    ])

    let advanceButton = NSMutableAttributedString(string: "Advance - With History", attributes: [
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30),
        NSAttributedString.Key.foregroundColor: UIColor.white
    ])
    
    // Showing History
    var showHistory = false
    @IBAction func historyClicked(_ sender: Any) {
        if (!showHistory){
            showHistory = true
            historyPane.isHidden = false
            historyPane.isEnabled = true
            historyButtontext.setAttributedTitle(simpleButton, for: .normal)
        } else {
            showHistory = false
            historyPane.isHidden = true
            historyPane.isEnabled = false
            historyPane.text = ""
            historyButtontext.setAttributedTitle(advanceButton, for: .normal)
        }
    }
    
    // Alert for invalid inputs
    func displayError(){
        let alert = UIAlertController(title: "Error!", message: "Invalid Input", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func numbersAndOperatorsClicked(_ sender: UIButton){
        let array = myCalc.operationArray
        if let input = sender.titleLabel?.text {
            if (array.isEmpty) {
                if (Int(input) != nil) {
                    myCalc.push(s: input)
                    outputLabel.text = myCalc.statement
                } else {
                    displayError()
                }
            } else {
                myCalc.push(s: input)
                outputLabel.text = myCalc.statement
            }
        } else {
            displayError()
        }
    }
    
    @IBAction func equalsClicked(_ sender: Any) {
        if myCalc.operationArray.isEmpty {
            displayError()
        } else {
            let result: Int = myCalc.calc()
            myCalc.statement.append("=\(result)")
            myCalc.operationArray = [String]()
            myCalc.result = 0
            outputLabel.text = myCalc.statement
            if historyPane.isEnabled {
                historyPane.text?.append("\(myCalc.statement)\n")
            }
        }
    }
    @IBAction func clearClicked(_ sender: Any) {
        myCalc.statement = ""
        myCalc.operationArray = [String]()
        outputLabel.text = myCalc.statement
    }
    
}

