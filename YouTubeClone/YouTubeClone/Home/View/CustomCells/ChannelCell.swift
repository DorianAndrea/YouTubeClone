//
//  ChannelCell.swift
//  YouTubeClone
//
//  Created by mac on 12-05-25.
//

import UIKit

class ChannelCell: UITableViewCell {
<<<<<<< HEAD

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell(){
=======
    
    @IBOutlet weak var bannerChannel: UIImageView!
    @IBOutlet weak var channelInfoLabel: UILabel!
    @IBOutlet weak var subscriberNumbersLabel: UILabel!
    @IBOutlet weak var bellImage: UIImageView!
    @IBOutlet weak var subscribeLabel: UILabel!
    @IBOutlet weak var channelTitle: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("ChannelCell loaded from XIB")
        configView()
       
    }
    
    private func configView(){
        bellImage.image = UIImage(named: "bell")?.withRenderingMode(.alwaysTemplate)
        bellImage.tintColor = UIColor(named: "appGrayColor")
        profileImage.layer.cornerRadius = 51/2
    }

    func configCell(model : ChannelModel.Item){
        channelInfoLabel.text = model.snippet.description
        channelTitle.text = model.snippet.title
        subscriberNumbersLabel.text = "\(model.statistics?.subscriberCount ?? "0") subscribers · \(model.statistics?.videoCount ?? "0") videos"
        
        if let bannerUrl = model.brandingSettings?.image.bannerExternalUrl, let url = URL(string: bannerUrl){
            bannerChannel.kf.setImage(with: url)
        }
        
        let imageUrl = model.snippet.thumbnails.medium.url
        
        guard let url = URL(string: imageUrl) else{
            return
        }
        profileImage.kf.setImage(with: url)
>>>>>>> parent of 8104a40 (bannerChannel)
        
    }
    
}
