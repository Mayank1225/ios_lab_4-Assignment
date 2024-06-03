//
//  ViewController.swift
//  lab_4-Assignment
//
//  Created by user252704 on 6/1/24.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    
    
    @IBOutlet weak var displayMessage: UILabel!
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    
    
    @IBOutlet weak var displayAgreement: UITextView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addTextInView()
        }
        
    func addTextInView() {
        let firstNameText = firstName.text?.isEmpty == false ? firstName.text! : "{FIRST NAME,"
                let lastNameText = lastName.text?.isEmpty == false ? lastName.text! : "LAST NAME}"
                let addressText = address.text?.isEmpty == false ? address.text! : "{ADDRESS}"
                let cityText = city.text?.isEmpty == false ? city.text! : "{CITY}"
                let dateText = dateOfBirth.text?.isEmpty == false ? dateOfBirth.text! : "{DATE OF BIRTH}"
                
                displayAgreement.text = " I, \(firstNameText) \(lastNameText), currently living at \(addressText) in the city of \(cityText) do hereby accept the terms and conditions assignment. \n \n I am \(dateText) and therefore am able to accept the conditions of this assignment."
    }

    func clearInfo() {
        displayMessage.text = "Constrains and Stacks";
        firstName.text = "";
        lastName.text = "";
        address.text = "";
        city.text = "";
        dateOfBirth.text = "";
        displayAgreement.text = "";
        addTextInView();
    }
    @IBAction func resetButton(_ sender: Any) {
        clearInfo()
        displayMessage.textColor = UIColor.black;
        displayAgreement.textColor = UIColor.black;
    }
    
    
    @IBAction func declineButton(_ sender: Any) {
        if displayAgreement.text?.isEmpty != true {
            clearInfo();
            displayAgreement.text = "User Declined";
            displayAgreement.textColor = UIColor.red
            displayMessage.text = "Constrains and Stacks";        }
    }
    
    @IBAction func firstNameChange(_ sender: UITextField) {
        addTextInView()
    }
    
    @IBAction func lastNamechange(_ sender: UITextField) {
        addTextInView()
    }
    
    @IBAction func addressChange(_ sender: UITextField) {
        addTextInView()
    }
    
    @IBAction func cityChange(_ sender: UITextField) {
        addTextInView()
    }
    @IBAction func dateOfBirthChange(_ sender: UITextField) {
        addTextInView()
    }
    
    @IBAction func acceptButton(_ sender: Any) {
        
        
        let val1 = dateOfBirth.text ?? "";
        
        let date = val1.split(separator: "-")
        if date.count == 3 {
            let year = date[2]
            if (Int(year)! > 2006){
                displayMessage.text = "Age must be > 18";
            }
        } else {
            displayMessage.text = "Invalid date format";
        }
        if firstName.text?.isEmpty == true || lastName.text?.isEmpty == true   || address.text?.isEmpty == true || dateOfBirth.text?.isEmpty==true || city.text?.isEmpty == true {
            displayMessage.text = "Complete the missing info! \n";
            displayMessage.textColor = UIColor.red;
        } else {
            displayMessage.text = "Accepted";
        }

    }
    
}

