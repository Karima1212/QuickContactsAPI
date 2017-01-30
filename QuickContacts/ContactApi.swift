//
//  ContactApi.swift
//  QuickContacs
//
//  Created by Pascal Rettig on 1/17/17.
//  Copyright © 2017 Pascal Rettig. All rights reserved.
//

import Foundation


class ContactApi {
    
    static let api = ContactApi()
    
    var contacts = [
        Contact(id: 1, name: "Svend Karlson", company: "Company Co",
                email: "svend@test.com"),
        Contact(id: 2, name: "Bob Smith", company: "Company Co",
                email: "bob@test.com")
    ]
    
    func getContacts(callback:@escaping ([Contact]) -> Void) {
        callback(contacts)
    }
    
    func getContact(_ id:Int, callback:@escaping (Contact?) -> Void) {
        if let contact = contacts.filter({ $0.id == id }).first {
            callback(contact)
        } else {
            callback(nil)
        }
    }
    
    func saveContact(_ contact:Contact, callback:@escaping () -> Void) {
        var contact = contact
        if let index = contacts.index(where: { $0.id == contact.id }) {
            contacts[index] = contact
        } else {
            contact.id = (contacts.map({ $0.id }).max() ?? 0) + 1
            contacts.append(contact)
        }
        callback()
    }
    
}
