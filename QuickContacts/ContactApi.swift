//
//  ContactApi.swift
//  QuickContacs
//
//  Created by Pascal Rettig on 1/17/17.
//  Copyright © 2017 Pascal Rettig. All rights reserved.
//

import Foundation
import Parse

class ContactApi {
    
    static let api = ContactApi()
    
    func getContacts(callback:@escaping ([Contact],String?) -> Void) {
        let query = PFQuery(className:"Contacts")
        query.order(byAscending: "name")
        query.findObjectsInBackground() {
            objects, error in
            
            if error == nil {
                var contacts:[Contact] = []
                
                if let objects = objects {
                    for object in objects {
                        contacts.append(Contact(object))
                    }
                    callback(contacts, nil)
                } else {
                    callback([], "Error")
                }
            } else {
                callback([], "Error" )
                // Log details of the failure
                print("Error: \(error!) \(error!.localizedDescription)")
            }
        }
    }
    
    func getContact(_ id:String, callback:@escaping (Contact?) -> Void) {
        let query = PFQuery(className:"Contacts")
        query.getObjectInBackground(withId: id) { (object, err) in
            if let object = object {
                callback(Contact(object))
            } else {
                callback(nil)
            }
            
        }
    }
    
    func saveContact(_ contact:Contact, callback:@escaping (String?) -> Void) {
        let parseObject = contact.toPFObject()
        
        parseObject.saveInBackground()  { (ok, error) in
            callback(ok ? nil : error?.localizedDescription)
        }
    }
    
}
