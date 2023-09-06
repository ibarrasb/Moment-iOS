//
//  MainTabViewController.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 8/30/23
import SwiftUI

struct MainTabViewController: View {
    @State private var selectedIndex = 0

    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedViewController()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)

            EngagementViewController()
                .tabItem {
                    Image(systemName: "person.3.fill")
                }
                .tag(1)

            CreateViewController()
                .tabItem {
                    Image(systemName: "capsule.inset.filled")
                }
                .tag(2)

            MessagesViewController()
                .tabItem {
                    Image(systemName: "tray")
                }
                .tag(3)

            ProfileViewController()
                .tabItem {
                    Image(systemName: "person.fill")
                }
                .tag(4)
        }
        .background(Color.gray) // Set your desired background color here
    }
}

struct MainTabViewController_Previews: PreviewProvider {
    static var previews: some View {
        MainTabViewController()
    }
}
