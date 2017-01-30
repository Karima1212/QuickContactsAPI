//
//  ViewContactController.swift
//  QuickContacts
//
//  Created by Pascal Rettig on 1/30/17.
//  Copyright © 2017 Pascal Rettig. All rights reserved.
//

import UIKit

class ViewContactController: UIViewController {
    
    var contactId: Int!
    
    var contact: Contact?

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var companyLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadContact()
        // Do any additional setup after loading the view.
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(ViewContactController.editContact)), animated: true)
    }
    
    func editContact() {
        self.performSegue(withIdentifier: "editSegue", sender: self)
    }
    
    
    func loadContact() {
        ContactApi.api.getContact(contactId) { loadedContact in
            self.title = loadedContact?.name
            self.contact = loadedContact
            self.nameLabel.text = loadedContact?.name
            self.companyLabel.text = loadedContact?.company
            self.emailLabel.text = loadedContact?.email
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "editSegue" {
            let destination = segue.destination as! ContactFormController
            destination.contact = contact
        }
    
    }

}
