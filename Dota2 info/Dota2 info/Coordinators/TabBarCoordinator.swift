//
//  TabBarCoordinator.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 24.03.2023.
//

import UIKit
import SwiftUI

final class TabBarCoordinator: BaseCoordinator {
    
    typealias PresentableTab = (presentable: Presentable, tabItem: UITabBarItem)

    // MARK: Init
    private let tabBarController: SystemTabBarController
    private let coordinatorsFactory: CoordinatorsFactoring

    init(
        tabBarController: SystemTabBarController,
        coordinatorsFactory: CoordinatorsFactoring,
        router: Routable,
        parent: BaseCoordinator?
    ) {
        self.tabBarController = tabBarController
        self.coordinatorsFactory = coordinatorsFactory

        super.init(router: router, parent: parent)
    }
}

// MARK: - Coordinator

extension TabBarCoordinator: Coordinator {
    func start(with _: Void) {
        prepareTabs()
    }
}

private extension TabBarCoordinator {
    func prepareTabs() {
        let main: PresentableTab = makeTournamentsTab()
        let favoutire: PresentableTab = (UIHostingController(rootView: ContentView()), makeBarItem(for: .favourite))
        
        setPresentable([main, favoutire])
        
        router.setRootModule(tabBarController, hideNavigationBar: false, animated: false)
    }
    
    func makeTournamentsTab() -> PresentableTab {
        let unit = coordinatorsFactory.makeTournamentsCoordinator(parent: self)
        unit.coordinator.start()

        return (unit.view, makeBarItem(for: .main))
    }

    func makeBarItem(for tab: RootTab) -> UITabBarItem {
        return UITabBarItem(rootTab: tab)
    }
    
    func setPresentable(_ presentables: [PresentableTab]) {
        presentables.forEach { presentable, tab in
            presentable.toPresent.tabBarItem = tab
        }
        tabBarController.setViewControllers(presentables.map(\.presentable.toPresent), animated: false)
    }
}

public final class SystemTabBarController: UITabBarController {

    override public func viewDidLoad() {
        super.viewDidLoad()
    
        setupAppearance()
        definesPresentationContext = true
    }
}

// MARK: - Appearance

private extension SystemTabBarController {
    func setupAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        let tabBarItemAppearance = UITabBarItemAppearance(style: .stacked)
        
        tabBarItemAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor(red: 0.141, green: 0.157, blue: 0.169, alpha: 1)
        ]
        
        tabBar.backgroundColor = .green
        tabBar.tintColor = .red
//        tabBar.barTintColor = .green
        
        tabBar.scrollEdgeAppearance = tabBarAppearance
    }
}

class ColorPalette {
    static var mainBackground: UIColor {
        UIColor(red: 24/255, green: 40/255, blue: 57/255, alpha: 1)
    }

    static var separator: UIColor {
        UIColor(red: 62/255, green: 73/255, blue: 88/255, alpha: 1)
    }

    static var mainText: UIColor {
        UIColor(red: 216/255, green: 218/255, blue: 220/255, alpha: 1)
    }

    static var text: UIColor {
        UIColor(red: 165/255, green: 170/255, blue: 177/255, alpha: 1)
    }

    static var subtitle: UIColor {
        UIColor(red: 133/255, green: 139/255, blue: 146/255, alpha: 1)
    }

    static var alternativeBackground: UIColor {
        UIColor(red: 43/255, green: 55/255, blue: 71/255, alpha: 1)
    }

    static var accent: UIColor {
        UIColor(red: 255/255, green: 165/255, blue: 0/255, alpha: 1)
    }

    static var win: UIColor {
        UIColor(red: 102/255, green: 187/255, blue: 111/255, alpha: 1)
    }

    static var lose: UIColor {
        UIColor(red: 255/255, green: 77/255, blue: 79/255, alpha: 1)
    }

    static var error: UIColor {
        UIColor(red: 161/255, green: 1/255, blue: 1/255, alpha: 1)
    }

    // Plot Lines
    static var line1: UIColor {
        UIColor(red: 233/255, green: 59/255, blue: 129/255, alpha: 1)
    }

    static var line2: UIColor {
        UIColor(red: 245/255, green: 171/255, blue: 201/255, alpha: 1)
    }

    static var line3: UIColor {
        UIColor(red: 102/255, green: 187/255, blue: 111/255, alpha: 1)
    }

    static var line4: UIColor {
        UIColor(red: 130/255, green: 215/255, blue: 243/255, alpha: 1)
    }

    static var line5: UIColor {
        UIColor(red: 134/255, green: 122/255, blue: 233/255, alpha: 1)
    }

    static var line6: UIColor {
        UIColor(red: 196/255, green: 73/255, blue: 194/255, alpha: 1)
    }

    static var line7: UIColor {
        UIColor(red: 255/255, green: 179/255, blue: 25/255, alpha: 1)
    }

    static var line8: UIColor {
        UIColor(red: 184/255, green: 233/255, blue: 216/255, alpha: 1)
    }

    static var line9: UIColor {
        UIColor(red: 238/255, green: 115/255, blue: 46/255, alpha: 1)
    }

    static var line10: UIColor {
        UIColor(red: 198/255, green: 213/255, blue: 126/255, alpha: 1)
    }
}

public enum RootTab {
    case main
    case favourite
    
    public var info: TabBarItemModel {
        switch self {
        case .main:
            return .init(title: "Main", image: .init(systemName: "trophy.circle")!, selectedImage: .init(systemName: "trophy.circle")!)
        case .favourite:
            return .init(title: "Main", image: .init(systemName: "heart.fill")!, selectedImage: .init(systemName: "heart.fill")!)
        }
    }
}
public struct TabBarItemModel {
    public let title: String
    public let image: UIImage
    public let selectedImage: UIImage

    internal init(
        title: String,
        image: UIImage,
        selectedImage: UIImage
    ) {
        self.title = title
        self.image = image
        self.selectedImage = selectedImage
    }
}

extension UITabBarItem {
    convenience init(rootTab: RootTab) {
        self.init(
            title: rootTab.info.title,
            image: rootTab.info.image,
            selectedImage: nil
        )
    }
}
