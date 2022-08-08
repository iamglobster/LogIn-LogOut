//
//  UserVC.swift
//  LogOut
//
//  Created by Yaroslav on 23.11.2021.
//

import UIKit

class UserVC: UIViewController {
    @IBOutlet weak var profileButton: UIButton!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = userName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userProfile" {
            let userProfile = segue.destination as! UserProfileVC
            userProfile.profileName = userName
        }
    }
    
}
