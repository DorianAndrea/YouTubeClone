import Foundation

protocol HomeViewProtocol: AnyObject{
    func getData(list : [[Any]], sectionTitleList : [String])
}

class HomePresenter{
    var provider : HomeProviderProtocol
    weak var delegate : HomeViewProtocol?
    private var objectList : [[Any]] = []
    private var sectionTitleList : [String] = []
    
    init(delegate : HomeViewProtocol, provider : HomeProviderProtocol = HomeProvider()){
        self.provider = provider
        self.delegate = delegate
        #if DEBUG
        if MockManager.shared.runAppWithMock{
            self.provider = HomeProviderMock()
        }
        #endif
        
    }
    
    @MainActor
    func getHomeObjects() async{
        objectList.removeAll()
        sectionTitleList.removeAll()
        
        async let channel = try await provider.getChannel(channelId: Constants.channelId).items
        async let playlist = try await provider.getPlaylists(channelId: Constants.channelId).items
        async let videos = try await provider.getVideos(searchString: "", channelId: Constants.channelId).items
        
        do{
            let responseChannel = try await channel
            let responsePlaylist = try await playlist
            let responseVideos = try await videos
            
            //Index 0
            objectList.append(responseChannel)
            sectionTitleList.append("")
            
            if let playlistId = responsePlaylist.first?.id, let playlistItems = await getPlaylistItems(playlistId: playlistId){
                //Index 1
                objectList.append(playlistItems.items.filter({$0.snippet.title != "Private video"}))
                sectionTitleList.append(responsePlaylist.first?.snippet?.title ?? "")
            }
            //Index 2
            objectList.append(responseVideos)
            sectionTitleList.append("Uploads")
            
            //Index 3
            objectList.append(responsePlaylist)
            sectionTitleList.append("Created Playlists")
         
            print("channel", responseChannel)
            print("playlist", responsePlaylist)
            print("videos", responseVideos)
            delegate?.getData(list: objectList, sectionTitleList: sectionTitleList)
            
            
        }catch{
            print(error)
        }
        
        
    }
    
    func getPlaylistItems(playlistId: String) async -> PlaylistItemsModel?{
        do{
            let playlistItems = try await provider.getPlaylistItems(playlistId: playlistId)
            return playlistItems
        }catch{
            print("error:", error)
            return nil
        }
    }
}
