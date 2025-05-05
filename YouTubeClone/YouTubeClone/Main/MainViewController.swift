//
//  MainViewController.swift
//  YouTubeClone
//
//  Created by Dorian Donoso Ampuero on 07-04-25.
//

import UIKit

class MainViewController: UIViewController {
    var rootPageViewController: RootPageViewController!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let destination = segue.destination as? RootPageViewController {
           destination.delegateRoot = self
           rootPageViewController = destination
       }
        
    }
}
extension MainViewController: RootPageProtocol{
    func currentPage(_ index: Int) {
        print("currentPage",index)
    }
    
    
    
    
}
