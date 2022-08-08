//
//  UserProfileVC.swift
//  LogOut
//
//  Created by Yaroslav on 23.11.2021.
//

import UIKit

class UserProfileVC: UIViewController {
    
    @IBOutlet weak var userProfileLable: UILabel!
    @IBOutlet weak var nextUserButton: UIButton!
    
    var profileName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userProfileLable.text = profileName
    }
}
