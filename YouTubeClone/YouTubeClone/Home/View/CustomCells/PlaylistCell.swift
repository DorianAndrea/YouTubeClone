//
//  PlaylistCell.swift
//  YouTubeClone
//
//  Created by Dorian Donoso Ampuero on 25-04-25.
//

import UIKit
import Kingfisher
class PlaylistCell: UITableViewCell {

    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoCount: UILabel!
    @IBOutlet weak var videoCountOverlay: UILabel!
    @IBOutlet weak var dotsImage: UIImageView!
    
    var didTapDotsButton : (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    private func configView(){
        selectionStyle = .none
        // cambiar color a la imagen
        dotsImage.image = UIImage(named: "dots")?.withRenderingMode(.alwaysTemplate)
        dotsImage.tintColor = UIColor(named: "appWhiteColor")
    }

    @IBAction func dotsButtonTopped(_ sender: Any) {
        if let tap = didTapDotsButton{
            tap()
        }
    }
    func configCell(model: PlaylistModel.Item){
        
        // dinamizar el titulo el video count y el count overlay
        videoTitle.text = model.snippet?.title
        videoCount.text = "\(model.contentDetails?.itemCount ?? 0) videos"
        videoCountOverlay.text = "\(model.contentDetails?.itemCount ?? 0)"
        let imageUrl = model.snippet?.thumbnails.medium.url
        if let url = URL(string: imageUrl!){
            videoImage.kf.setImage(with: url)
        }
        
    }
    
}
