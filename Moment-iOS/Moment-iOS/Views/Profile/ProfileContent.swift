//
//  ProfileContent.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 9/29/23.
//

import SwiftUI
struct ProfileContent: View {
    var user: User
    
    @State private var selectedTab: Tab = .list
    
    enum Tab {
        case list
        case calendar
        case mentions
    }
    
    var body: some View {
        ScrollView{
            VStack {
                Button(action: {
                    // Handle profile picture update
                }) {
                    
                    Image("eddiepic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 3))
                        .shadow(radius: 5)
                }
                .padding(.bottom, 10)
                
                if user.isPrivate {
                    Image(systemName: "lock")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                } else {
                    Image(systemName: "lock.open")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                }
               
                Text(user.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("@\(user.username)")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                
                Text(user.bio)
                    .font(.headline)
                    .foregroundColor(Color(.white))
                    .padding(.bottom, 2)
                
                Button(action: {
                    // Handle the action when the friends count is clicked
                }) {
                    Text("\(user.friendCount) friends")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                .padding(.bottom, 10)
                
                
                Button(action: {
                    // Handle edit profile action
                }) {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 10)
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                
                HStack(spacing: 20) {
                    CustomTabButton(title: "List", isSelected: selectedTab == .list) {
                        selectedTab = .list
                    }
                    
                    CustomTabButton(title: "Calendar", isSelected: selectedTab == .calendar) {
                        selectedTab = .calendar
                    }
                    CustomTabButton(title: "Mentions", isSelected: selectedTab == .mentions) {
                        selectedTab = .mentions
                    }
                }
                .padding(.bottom, 10)
                .padding(.top, 15)
                
                if selectedTab == .list {
                    ProfileListContent(posts: posts)}
                 else if selectedTab == .calendar{
                    Text("Calendar View Content")
                }
                else {
                    Text("Mentions")
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 10)
        }
    }
}

struct ProfileContent_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(name: "Eddie Ibarra", username: "ebarrra", bio: "Dallas // ", friendCount: 200, isPrivate: false)
        return ProfileContent(user: user)
    }
}
