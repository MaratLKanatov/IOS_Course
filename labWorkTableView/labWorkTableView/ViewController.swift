//
//  ViewController.swift
//  labWorkTableView
//
//  Created by Kanatov Marat on 20.10.2021.
//

import UIKit

class SettingTableItem {
    var title:String?
    var category:String?
    var imageName:String?
    
    init(settingTitle: String, settingCategory: String, imgName: String) {
        self.title = settingTitle
        self.category = settingCategory
        self.imageName = imgName
    }
}
	
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!

    var tableContent = [[SettingTableItem]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(MyCustomTableViewCell.nib(), forCellReuseIdentifier: MyCustomTableViewCell.identifier)
        
        let item1 = SettingTableItem(settingTitle: "Display", settingCategory: "Brightness - Navigation panel", imgName: "sun.max")
        let item2 = SettingTableItem(settingTitle: "Themes", settingCategory: "Wallpaper - Icon", imgName: "paintpalette")
        let item3 = SettingTableItem(settingTitle: "Screen", settingCategory: "Design - Indicators", imgName: "photo.tv")
        let item4 = SettingTableItem(settingTitle: "Biometry", settingCategory: "Fingerprint - Face recognition", imgName: "hand.tap")
        let item5 = SettingTableItem(settingTitle: "Confidencial", settingCategory: "Permissions", imgName: "shield.checkerboard")
        let item6 = SettingTableItem(settingTitle: "Location", settingCategory: "GPS - Access to location", imgName: "location")
        
        let item7 = SettingTableItem(settingTitle: "Connection", settingCategory: "WiFi - USB - Bluetooth", imgName: "wifi")
        
        let item8 = SettingTableItem(settingTitle: "Sounds", settingCategory: "Tune mode - Ring tone", imgName: "music.note")
        
        let item9 = SettingTableItem(settingTitle: "Notifications", settingCategory: "Status - Don't disturb", imgName: "bell.badge")
                
        tableContent.append([item7])
        tableContent.append([item8, item9])
        tableContent.append([item1, item2, item3])
        tableContent.append([item4, item5, item6])
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        tableView.tableFooterView = footer
    }
    
    // Table methods
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableContent.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContent[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyCustomTableViewCell.identifier, for: indexPath) as! MyCustomTableViewCell
        cell.configure(with: tableContent[indexPath.section][indexPath.row].title!,
                       subtitle: tableContent[indexPath.section][indexPath.row].category!,
                       imageName: tableContent[indexPath.section][indexPath.row].imageName!)
        return cell
    }
    
    // Other methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailVC {
            destination.setting = tableContent[((tableView.indexPathForSelectedRow)?.section)!][((tableView.indexPathForSelectedRow)?.row)!]
            tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
    }


}
