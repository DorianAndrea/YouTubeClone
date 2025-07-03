//
//  ChannelCell.swift
//  YouTubeClone
//
//  Created by mac on 12-05-25.
//

import UIKit

class ChannelCell: UITableViewCell {

    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var channelTitle: UILabel!
    @IBOutlet weak var subscribeLabel: UILabel!
    @IBOutlet weak var bellImage: UIImageView!
    @IBOutlet weak var subscriberNumbers: UILabel!
    @IBOutlet weak var channelInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       configView()
    }
    private func configView(){
        bellImage.image = UIImage(named: "bell")?.withRenderingMode(.alwaysTemplate)
        bellImage.tintColor = UIColor(named: "appGrayColor")
        profileImage.layer.cornerRadius = 51/2    // la medida 51 es porque mide 51 cuando se configuró
    }

    func configCell(model: ChannelModel.Item){
        channelInfo.text = model.snippet.description
        channelTitle.text = model.snippet.title
        subscriberNumbers.text = "\(model.statistics?.subscriberCount ?? "0" ) subscribers · \(model.statistics?.videoCount ?? "0") videos"
        
        if let bannerUrl = model.brandingSettings?.image.bannerExternalUrl, let url = URL(string: bannerUrl){
            bannerImage.kf.setImage(with: url)
        }
        
        let imageUrl = model.snippet.thumbnails.medium?.url
        guard let url = URL(string: imageUrl!)else{
            return
        }
        profileImage.kf.setImage(with: url)
        
    }
    
}
