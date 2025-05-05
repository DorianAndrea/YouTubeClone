import UIKit

protocol RootPageProtocol : AnyObject{
    func currentPage(_ index: Int)
}

class RootPageViewController: UIPageViewController {
    
    var subViewControllers = [UIViewController]()
    var currentIndex : Int = 0
    weak var delegateRoot : RootPageProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        setupViewControllers()
        
    }
    
    private func setupViewControllers() {
        subViewControllers = [
            HomeViewController(),
            VideosViewController(),
            PlaylistsViewController(),
            ChannelViewController(),
            AboutViewController(),
        ]
        _ = subViewControllers.enumerated().map({$0.element.view.tag = $0.offset})
        
        setViewControllerFromIndex(index: 0, direction: .forward) // indica que cargue
        
    }
    func setViewControllerFromIndex(index: Int, direction: NavigationDirection, animated: Bool = true){
        setViewControllers([subViewControllers[index]], direction: direction, animated: animated)
    }
    
}
extension RootPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource{ // acá esta el delegate y datasofurce de arriba
        
        //esta funcion permite configurar qué cantidad de pantallas voy a incorportar en el pageview controller
        func presentationCount(for pageViewController: UIPageViewController) -> Int {
            return subViewControllers.count
}
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // indicar cual es el control proximo y previo
        let index : Int = subViewControllers.firstIndex(of: viewController) ?? 0
        // validacion para que no regrese donde no hay vistas
        if index <= 0 {
            return nil
        }
        return subViewControllers[index-1]
    }
        
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // indicar cual es el control proximo
        let index : Int = subViewControllers.firstIndex(of: viewController) ?? 0
        // validacion para que no regrese donde no hay vistas
        if index >= (subViewControllers.count - 1)  {
            return nil
        }
        return subViewControllers[index+1]
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print ("finished", finished)
        
        
        if let index = pageViewController.viewControllers?.first?.view.tag {
           currentIndex = index
            delegateRoot?.currentPage(index)
        }
    }
  }
