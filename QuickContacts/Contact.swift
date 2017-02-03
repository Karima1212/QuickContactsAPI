//
//  Contact.swift
//  QuickContacts
//
//  Created by Pascal Rettig on 1/30/17.
//  Copyright © 2017 Pascal Rettig. All rights reserved.
//

import Foundation
import Parse

struct Contact {
    var id:String?
    var name:String!
    var company:String!
    var email:String!
    
    init(id: String?,
         name: String,
         company: String,
         email: String) {
        self.id = id
        self.name = name
        self.company = company
        self.email = email
    }
    
    init(_ obj:PFObject) {
        self.init(id: obj.objectId,
                name: obj["name"] as! String,
                company: obj["company"] as! String,
                email: obj["email"] as! String)
    }
    
    func toPFObject() -> PFObject {
        var parseObject:PFObject! = nil
        if let objectId = self.id {
            parseObject = PFObject(withoutDataWithClassName: "Contacts", objectId: objectId)
        } else {
            parseObject = PFObject(className: "Contacts")
        }
        
        parseObject["name"] = self.name
        parseObject["company"] = self.company
        parseObject["email"] = self.email
        return parseObject
    }
    
    
}
