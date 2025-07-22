//
//  PlaylistsPresenter.swift
//  YouTubeClone
//
//  Created by mac on 21-07-25.
//

import Foundation

protocol PlaylistsPresenter: AnyObject{
    func getPlaylists(playList: [PlaylistModel.Item])
}
