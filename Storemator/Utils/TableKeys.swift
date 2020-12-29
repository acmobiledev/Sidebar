//
//  TableKeys.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/29/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import Foundation
import UIKit

struct User {
    let username: String
    let imageString: String
    let emailID: String
    
}



struct TableKeys {
    static let Section = "section"
    static let Rows = "rows"
    static let ImageName = "imageName"
    static let Title = "title"
    static let SubTitle = "subTitle"
    static let signOut = "Sign Out"
    
    
    static func populateTableView(user: User) -> [[String: Any]] {
        return [
           [TableKeys.Rows : [[TableKeys.ImageName: user.imageString, TableKeys.Title: user.username, TableKeys.SubTitle: user.emailID]
        ]
        ] ,
        
           [TableKeys.Rows: [[TableKeys.Title: "Purchased"]]],
           
           [TableKeys.Rows: [[TableKeys.Title: "Personalised Recommendations"]]],
           
           [TableKeys.Rows: [[TableKeys.Title: "Redeem Gift Card or Code"], [TableKeys.Title: "Add Funds to Apple ID"]]],
           
           [TableKeys.Rows: [[TableKeys.Title: TableKeys.signOut]]]
        
        ]
    }
}
