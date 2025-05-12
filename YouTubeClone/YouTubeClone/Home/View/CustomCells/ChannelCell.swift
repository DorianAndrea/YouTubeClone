//
//  ChannelCell.swift
//  YouTubeClone
//
//  Created by Victor Roldan on 6/03/22.
//

import UIKit
import Kingfisher

class ChannelCell: UITableViewCell {
    

    @IBOutlet weak var channelBanner: UIImageView!
    @IBOutlet weak var channelInfoLabel: UILabel!
    @IBOutlet weak var subscriberNumbersLabel: UILabel!
   
   
    @IBOutlet weak var bell: UIImageView!
    
    @IBOutlet weak var subscribeLabel: UILabel!
    @IBOutlet weak var channelTitle: UILabel!
    
    @IBOutlet weak var channelsProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("ChannelCell loaded from XIB")
        configView()
       
    }
    
    private func configView(){
        bell.image = UIImage(named: "bell")?.withRenderingMode(.alwaysTemplate)
        bell.tintColor = UIColor(named: "appGrayColor")
        channelsProfile.layer.cornerRadius = 51/2
    }

    func configCell(model : ChannelModel.Item){
        channelInfoLabel.text = model.snippet.description
        channelTitle.text = model.snippet.title
        subscriberNumbersLabel.text = "\(model.statistics?.subscriberCount ?? "0") subscribers · \(model.statistics?.videoCount ?? "0") videos"
        
        if let bannerUrl = model.brandingSettings?.image.bannerExternalUrl, let url = URL(string: bannerUrl){
            channelBanner.kf.setImage(with: url)
        }
        
        let imageUrl = model.snippet.thumbnails.medium.url
        
        guard let url = URL(string: imageUrl) else{
            return
        }
        channelsProfile.kf.setImage(with: url)
        
    }
    
}
