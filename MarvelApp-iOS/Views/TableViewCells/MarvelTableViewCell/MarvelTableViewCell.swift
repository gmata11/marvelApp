//
//  MarvelTableViewCell.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 10/8/21.
//

import UIKit

class MarvelTableViewCell: UITableViewCell, ClassName {
    
    @IBOutlet weak var CharacterImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setName(characterName: String) {
        name.text = characterName
    }
    
    func setImage(path: String, xtension: String) {
        let url = URL(string: "\(path).\(xtension)")
        CharacterImage.sd_setImage(with: url) { (pic, error, cache, urls) in
            if (error != nil) {
                self.CharacterImage.image = UIImage(named: "Marvel")
            } else {
                self.CharacterImage.image = pic
            }
        }
    }
    
}
