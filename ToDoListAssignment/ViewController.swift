//
//  ViewController.swift
//  ToDoListAssignment
//
//  Created by IMCS2 on 7/25/19.
//  Copyright © 2019 Tanishk. All rights reserved.
//

import UIKit


var listArray: [String] = []

class ViewController: UIViewController {
    
    @IBAction func exitOnReturn(_ sender: Any) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
           self.view.endEditing(true)
        
    }
    
    
    @IBOutlet weak var GetDataTextField: UITextField!
    
    
    
    @IBAction func SubmitButtonPressed(_ sender: Any){
        //userdefault.set array
   // buttonPressed = true
        
       
       
        
        listArray.append(GetDataTextField.text!)
         UserDefaults.standard.set(listArray, forKey: "name")
        print("from Button \(listArray)")
        
        self.navigationController?.popViewController(animated: true)
        
        
        //ToDoListTableViewCell().CellLabel?.text = "nnnn"
        
//        guard sender is ToDoListTableViewCell else {
//            fatalError("Unexpected sender: \(sender)")
//        }
//
//        submitText.CellLabel.text = GetDataTextField.text
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }


}

