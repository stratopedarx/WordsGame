//
//  TabComponentProtocol.swift
//  WordsGame
//
//  Created by Sergey Lobanov on 30.07.2022.
//

import SwiftUI

protocol TabComponentProtocol {
    var tabIcon: IconName { get }
    var tabTitle: Localizable { get }
    var tag: MainTabsSelection { get }
    var view: AnyView { get }
}
