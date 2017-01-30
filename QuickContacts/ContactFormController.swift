//
//  ContactFormController.swift
//  QuickContacts
//
//  Created by Pascal Rettig on 1/30/17.
//  Copyright © 2017 Pascal Rettig. All rights reserved.
//

import UIKit

class ContactFormController: UIViewController {

    var contact: Contact!
    
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var companyField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameField.text = contact.name
        companyField.text = contact.company
        emailField.text = contact.email
        
          self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(ContactFormController.saveContact)), animated: true)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveContact() {
        contact.name = nameField.text
        contact.company = companyField.text
        contact.email = emailField.text
        
        ContactApi.api.saveContact(contact) {
            let controller = self.navigationController!.viewControllers[0] as! ContactsTableController
            
            controller.loadContacts()
             _ = self.navigationController?.popToViewController(controller, animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
