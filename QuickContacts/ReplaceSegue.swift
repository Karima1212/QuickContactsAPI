//
//  ReplaceSegue.swift
//  QuickContacts
//
//  Created by Pascal Rettig on 1/30/17.
//  Copyright © 2017 Pascal Rettig. All rights reserved.
//

import UIKit

class ReplaceSegue: UIStoryboardSegue {
    
    override func perform() {
        source.navigationController?.setViewControllers([destination], animated: true)
    }
}
