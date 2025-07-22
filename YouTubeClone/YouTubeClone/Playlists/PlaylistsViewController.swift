//
//  PlaylistsViewController.swift
//  YouTubeClone
//
//  Created by Dorian Donoso Ampuero on 07-04-25.
//

import UIKit

class PlaylistsViewController: UIViewController {

    @IBOutlet weak var tableViewPlaylist: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()

        func configTableView(){
            let nibPlaylists = UINib(nibName: "\(PlaylistCell.self)", bundle: nil)
            tableViewPlaylist.register(nibPlaylists, forCellReuseIdentifier: "\(PlaylistCell.self)")
            
            tableViewPlaylist.separatorColor = .clear
        }
    }


    

}
