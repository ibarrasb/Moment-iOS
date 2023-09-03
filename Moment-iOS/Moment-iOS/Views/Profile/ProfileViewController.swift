//
//  ProfileViewController.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 8/28/23.
//
import SwiftUI

struct User {
    let name: String
    let bio: String
    let friendCount: Int
    let isPrivate: Bool
}



struct ProfileViewController: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor.darkGray).edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        Text("Moment")
                            .font(Font.custom("Bodoni 72 Smallcaps", size: 50))
                            .foregroundColor(.white)
                            .padding(.leading, 20)
                        Spacer()
                        
                        NavigationLink(destination: SettingsViewController().navigationBarBackButtonHidden(true)) {
                            Image(systemName: "gear")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                                .padding(.trailing, 20)
                                
                        }
                        
                    }
                    
                    
                    // Move the user and ProfileContent here
                    let user = User(name: "Eddie Ibarra", bio: "Dallas // ", friendCount: 200, isPrivate: false)
                    ProfileContent(user: user)
                }
            }
        }
        
    }
    
}

struct ProfileContent: View {
    var user: User

    @State private var selectedTab: Tab = .list
    
    
    enum Tab {
        case list
        case calendar
    }

    var body: some View {
        VStack {
            Button(action: {
                // Handle profile picture update
            }) {
                
                Image("profile_picture")
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
            }
            .padding(.bottom, 10)

            if selectedTab == .list {
                Text("List View Content")
            } else {
                Text("Calendar View Content")
            }

            Spacer()
        }
        .padding(.horizontal)
    }
}

struct CustomTabButton: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        VStack {
            Text(title)
                .font(.subheadline)
                .fontWeight(isSelected ? .semibold : .regular)
                .foregroundColor(isSelected ? .white : .gray)
            
            if isSelected {
                Capsule()
                    .foregroundColor(Color(.systemBlue))
                    .frame(height: 3)
            } else {
                Capsule()
                    .foregroundColor(Color(.clear))
                    .frame(height: 3)
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                action()
            }
        }
    }
}

struct ProfileViewController_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewController()
    }
}