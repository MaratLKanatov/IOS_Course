//
//  MyCell.swift
//  GaleryAppCollectionViewUsed
//
//  Created by Kanatov Marat on 02.11.2021.
//

import UIKit

class MyCell: UICollectionViewCell {
    
    
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupImg(_ image:UIImage){
        self.image.image = image
    }

}
