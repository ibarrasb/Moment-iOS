//
//  EngagementViewController.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 8/30/23.
//
import SwiftUI

struct EngagementViewController: View {
    @State private var selectedTab: Tab = .notifications
    
    enum Tab {
        case notifications
        case friendRequests
    }
    
    // Sample notification data
    let notifications: [NotificationItem] = [
        NotificationItem(fullName: "John Doe", profilePicture: "profile_url", actionText: "liked your photo", timestamp: Date()),
        NotificationItem(fullName: "Alice Smith", profilePicture: "profile_url", actionText: "commented on your post", timestamp: Date()),
    ]
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                CustomTabButton(title: "Notifications", isSelected: selectedTab == .notifications) {
                    selectedTab = .notifications
                }
                
                CustomTabButton(title: "Requests", isSelected: selectedTab == .friendRequests) {
                    selectedTab = .friendRequests
                }
            }
            .padding(.bottom, 10)
            .padding(.top, 15)
            
            if selectedTab == .notifications {
                NotificationsView(notifications: notifications) // Pass the notifications array
            } else if selectedTab == .friendRequests {
                Text("Friend Requests Content")
            }
            
            Spacer()
        }
        .padding()
        .background(Color.black.opacity(0.8))
    }
}



struct EngagementViewController_Previews: PreviewProvider {
    static var previews: some View {
        EngagementViewController()
    }
}
