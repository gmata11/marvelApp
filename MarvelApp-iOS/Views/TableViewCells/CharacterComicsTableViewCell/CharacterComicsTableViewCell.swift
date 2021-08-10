//
//  CharacterComicsTableViewCell.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 10/8/21.
//

import UIKit

class CharacterComicsTableViewCell: UITableViewCell, ClassName {

    @IBOutlet weak var comicName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setComicName(name: String) {
        comicName.text = name
    }
    
}
