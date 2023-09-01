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
                Text("Notifications Content")
            } else if selectedTab == .friendRequests {
                Text("Friend Requests Content")
            }
            
            Spacer()
        }
        .padding()
        .background(Color(UIColor.darkGray))
    }
}



struct EngagementViewController_Previews: PreviewProvider {
    static var previews: some View {
        EngagementViewController()
    }
}
