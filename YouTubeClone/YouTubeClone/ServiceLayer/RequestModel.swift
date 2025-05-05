//
//  RequestModel.swift
//  YouTubeClone
//
//  Created by Dorian Donoso Ampuero on 07-10-24.
//

import Foundation

struct RequestModel{
    let endpoint: Endpoints
    var queryItems: [String:String]?
    let httpMethod: HttpMethod = .GET
    var baseUrl: URLBase = .youtube
    
    func getURL() -> String {
        var urlString = baseUrl.rawValue + endpoint.rawValue
        if let queryItems = queryItems, !queryItems.isEmpty {
            let query = queryItems.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
            urlString += "?" + query
        }
        return urlString
    }
    
    enum HttpMethod :String{
        case GET
        case POST
    }
    
    enum Endpoints: String {
        case search = "/search"
        case channels = "/channels"
        case playlist = "/playlists"
        case playlistItems = "/playlistItems"
        case empty = ""
    }
    
    enum URLBase : String{
        case youtube = "https://youtube.googleapis.com/youtube/v3"
        case google = "https://othereweb.com/v2"
    }
}
