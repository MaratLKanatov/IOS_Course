//
//  DetailVC.swift
//  labWorkTableView
//
//  Created by Kanatov Marat on 20.10.2021.
//

import UIKit

class DetailVC: UIViewController {
    var setting: SettingTableItem?
    @IBOutlet var navItem:UINavigationItem!
    @IBOutlet var myLabel:UILabel!
    @IBOutlet var img:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        navItem.title = setting?.title
        myLabel.text = setting?.category
        img.image = UIImage(systemName: (setting?.imageName)!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
