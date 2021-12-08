//
//  MyCustomTableViewCell.swift
//  labWorkTableView
//
//  Created by Kanatov Marat on 20.10.2021.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {
    
    @IBOutlet var title:UILabel!
    @IBOutlet var subtitle:UILabel!
    @IBOutlet var logo:UIImageView!
    
    static let identifier = "MyCustomTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "MyCustomTableViewCell", bundle: nil)
    }
    
    public func configure(with title:String, subtitle:String, imageName:String) {
        self.title.text = title
        self.subtitle.text = subtitle
        self.logo.image = UIImage(systemName: imageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
