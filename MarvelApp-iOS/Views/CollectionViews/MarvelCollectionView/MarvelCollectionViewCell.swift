//
//  MarvelCollectionViewCell.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import UIKit
import SDWebImage

class MarvelCollectionViewCell: UICollectionViewCell, ClassName {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setName(characterName: String) {
        name.text = characterName
    }
    
    func setImage(path: String, xtension: String) {
        let url = URL(string: "\(path).\(xtension)")
        image.sd_setImage(with: url) { (pic, error, cache, urls) in
            if (error != nil) {
                self.image.image = UIImage(named: "Marvel")
            } else {
                self.image.image = pic
            }
        }
    }
    
    

}
