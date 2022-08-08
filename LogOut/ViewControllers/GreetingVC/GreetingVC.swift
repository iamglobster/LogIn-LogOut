//
//  GreetingVC.swift
//  LogOut
//
//  Created by Yaroslav on 22.11.2021.
//

import UIKit

//MARK: - ViewController
class GreetingVC: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var welcomeLable: UILabel!
    @IBOutlet weak var emojiLable: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    
    var name: String!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLable.text = name
    }
}
