//
//  ContactsTableController.swift
//  QuickContacts
//
//  Created by Pascal Rettig on 1/30/17.
//  Copyright © 2017 Pascal Rettig. All rights reserved.
//

import UIKit

class ContactsTableController: UITableViewController {

    var contacts:[Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Quick Contacts"
        
        loadContacts()
        
         self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ContactsTableController.addContact)), animated: true)
    }
    
    func loadContacts() {
        ContactApi.api.getContacts() { loadedContacts, err in
            if (err != nil) {
                let alertController = UIAlertController(title: "Network Error", message: "Cannot load contacts", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            } else {
                self.contacts = loadedContacts
                self.tableView.reloadData()
            }
        }
    }
    
    func addContact() {
        self.performSegue(withIdentifier: "addSegue", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        
        let row = indexPath.row
        let contact = contacts[row]
        
        cell.nameLabel.text = contact.name
        cell.companyLabel.text = contact.company
    
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "detailSegue" {
            let destination = segue.destination as! ViewContactController
            let row = self.tableView.indexPathForSelectedRow?.row
            destination.contactId = self.contacts[row!].id!
        } else if segue.identifier == "addSegue" {
            let destination = segue.destination as! ContactFormController
            destination.contact = Contact(id: nil, name: "", company: "", email: "")
            
        }
    }

}
