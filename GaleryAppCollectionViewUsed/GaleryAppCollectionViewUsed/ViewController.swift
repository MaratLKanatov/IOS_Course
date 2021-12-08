//
//  ViewController.swift
//  GaleryAppCollectionViewUsed
//
//  Created by Kanatov Marat on 02.11.2021.
//

import UIKit

var images = [UIImage]()

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let cellsCount = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(UINib(nibName: "MyCell", bundle: nil), forCellWithReuseIdentifier: "MyCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        images.append(UIImage(named: "img01")!)
        images.append(UIImage(named: "img02")!)
        images.append(UIImage(named: "img03")!)
        images.append(UIImage(named: "img04")!)
        images.append(UIImage(named: "img05")!)
        images.append(UIImage(named: "img06")!)
        images.append(UIImage(named: "img01")!)
        images.append(UIImage(named: "img02")!)
        images.append(UIImage(named: "img03")!)
        images.append(UIImage(named: "img04")!)
        images.append(UIImage(named: "img05")!)
        images.append(UIImage(named: "img06")!)
    }
}

extension ViewController:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.setupImg(images[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameVC = collectionView.frame
        
        let widthCell = frameVC.width / CGFloat(cellsCount)
        let heightCell = CGFloat(240)
        
        return CGSize(width: widthCell, height: heightCell)
        // UIScreen.main.bounds.width
    }
    
}
