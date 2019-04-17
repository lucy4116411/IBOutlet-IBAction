//
//  InitViewController.swift
//  IBOutlet&IBAction
//
//  Created by User on 2019/4/16.
//  Copyright © 2019 Lu. All rights reserved.
//

import UIKit

class InitViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var textFieldMoney: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldMoney.delegate=self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
