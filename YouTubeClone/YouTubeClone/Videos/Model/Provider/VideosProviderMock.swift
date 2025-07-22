//
//  VideosProviderMock.swift
//  YouTubeClone
//
//  Created by mac on 20-07-25.
//

import Foundation

class VideosProviderMock: VideoProviderProtocol{
    func getVideos(channelId: String) async throws -> VideoModel{
        guard let model = Utils.parseJson(jsonName: "VideoList", model: VideoModel.self) else{
            throw NetworkError.jsonDecoder
        }
        return model
    }
        
    
}
