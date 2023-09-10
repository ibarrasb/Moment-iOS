//
//  NotificationsView.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 8/28/23.
//

import SwiftUI
// Helper function to calculate the time ago
public func timeAgoSinceDate(_ date: Date) -> String {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.second, .minute, .hour, .day, .weekOfYear], from: date, to: Date())
    
    if let week = components.weekOfYear, week >= 1 {
        return "\(week)w ago"
    } else if let day = components.day, day >= 1 {
        return "\(day)d ago"
    } else if let hour = components.hour, hour >= 1 {
        return "\(hour)h ago"
    } else if let minute = components.minute, minute >= 1 {
        return "\(minute)m ago"
    } else if let second = components.second, second >= 3 {
        return "\(second)s ago"
    } else {
        return "Just now"
    }
}

// Sample Notification Data Model
struct NotificationItem {
    var fullName: String
    var profilePicture: String // URL or image data
    var actionText: String // e.g., "liked your photo" or "commented on your post"
    var timestamp: Date
}

struct NotificationsView: View {
    let notifications: [NotificationItem] // Replace with actual data

    var body: some View {
        
        List(notifications, id: \.timestamp) { notification in
            HStack {
                Image("eddiepic") // Placeholder for profile picture
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
                
                VStack(alignment: .leading) {
                    Text(notification.fullName)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(notification.actionText)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                
                
                Spacer()
                
                Text(timeAgoSinceDate(notification.timestamp))
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .listRowBackground(Color.black.opacity(0.0))
            .padding(.vertical, 8)
            .cornerRadius(10)
        
        }
        .listStyle(PlainListStyle())
        
    }
    
  
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView(notifications: [
            NotificationItem(fullName: "John Doe", profilePicture: "profile_url", actionText: "liked your photo", timestamp: Date()),
            NotificationItem(fullName: "Alice Smith", profilePicture: "profile_url", actionText: "commented on your post", timestamp: Date()),
        ])
    }
}
