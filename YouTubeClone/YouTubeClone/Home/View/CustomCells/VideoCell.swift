import UIKit
import Kingfisher

class VideoCell: UITableViewCell {

    @IBOutlet weak var dotsImage: UIImageView!
    @IBOutlet weak var viewsCountLabel: UILabel!
    @IBOutlet weak var channelName: UILabel!
    @IBOutlet weak var videoName: UILabel!
    @IBOutlet weak var videoImage: UIImageView!
    //clousure investigar que es
    var didTapDotsButton : (()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }

    @IBAction func dotsButtonTapped(_ sender: Any) {
        if let tap = didTapDotsButton{
            tap()
        }
    }
    private func configView(){
        selectionStyle = .none
    }
    
    func configCell(model : Any){
        dotsImage.image = UIImage(named: "dots")?.withRenderingMode(.alwaysTemplate)
        dotsImage.tintColor = UIColor(named: "appWhiteColor")
        
        if let video = model as? VideoModel.Item{
            if let imageUrl = video.snippet?.thumbnails.medium?.url, let url = URL(string: imageUrl){
                videoImage.kf.setImage(with: url)
            }
            videoName.text = video.snippet?.title ?? ""
            channelName.text = video.snippet?.channelTitle ?? ""
            
            viewsCountLabel.text = "\(video.statistics?.viewCount ?? "0") views · 3 months ago"
            
            
            
        }else if let playlistItems = model as? PlaylistItemsModel.Item { // Playlist Items
            if let imageUrl = playlistItems.snippet.thumbnails.medium?.url, let url = URL(string: imageUrl){
                videoImage.kf.setImage(with: url)
            }
            videoName.text = playlistItems.snippet.title
            channelName.text = playlistItems.snippet.channelTitle
            
            viewsCountLabel.text = "332 views · 3 months ago"
            
            
        }
        
    }
    
    
}
