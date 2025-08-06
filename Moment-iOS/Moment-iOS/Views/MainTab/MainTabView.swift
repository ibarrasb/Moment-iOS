//  MainTabView.swift
//  Moment-iOS
//
//  Updated by ChatGPT on 8/6/25
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 4

    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }

    var body: some View {
        NavigationStack {
            TabView(selection: $selectedIndex) {
                FeedViewController()
                    .tabItem {
                        Label("Feed", systemImage: "newspaper.fill")
                    }
                    .tag(0)

                EngagementViewController()
                    .tabItem {
                        Label("Friends", systemImage: "person.3.fill")
                    }
                    .tag(1)

                CreateViewController()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                    .tag(2)

                MessagesViewController()
                    .tabItem {
                        Label("Messages", systemImage: "message.fill")
                    }
                    .tag(3)

                ProfileViewController()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
                    .tag(4)
            }
            .accentColor(.white)
        }
    }
}

#Preview {
    MainTabView()
}
