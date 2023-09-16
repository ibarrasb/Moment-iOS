//
//  SettingsViewController.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 9/1/23.
//

import SwiftUI

struct SettingsViewController: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor(.black)).edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        // Custom back button
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left") // You can use any back arrow image here
                                .foregroundColor(.white)
                                .padding(.leading, 16)
                        }
                        
                        Spacer()
                        
                        Text("Settings")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.leading, -35)
                        Spacer()
                    }
                    .frame(height: 44)
                    
                    List {
                        Section(header: Text("Account").foregroundColor(.white)) {
                            NavigationLink(destination: Text("Blocked Accounts")) {
                                Text("Blocked Accounts")
                                    .foregroundColor(.white)
                            }
                            .listRowBackground(Color(UIColor.darkGray))
                            
                            NavigationLink(destination: Text("Privacy")) {
                                Text("Privacy")
                                    .foregroundColor(.white)
                            }
                            .listRowBackground(Color(UIColor.darkGray))
                        }
                        
                        Section(header: Text("Support").foregroundColor(.white)) {
                            NavigationLink(destination: Text("Help & Support")) {
                                Text("Help & Support")
                                    .foregroundColor(.white)
                                
                            }
                            .listRowBackground(Color(UIColor.darkGray))
                            
                            NavigationLink(destination: Text("About")) {
                                Text("About")
                                    .foregroundColor(.white)
                            }
                            .listRowBackground(Color(UIColor.darkGray))
                            
                        }
                        
                        Section {
                            Button(action: {
                                // Perform logout action here
                            }) {
                                Text("Log Out")
                                    .foregroundColor(.red)
                            }
                        }
                        .listRowBackground(Color(UIColor.darkGray))
                    }
                    .background(Color.black.opacity(0.9))
                    .listStyle(.insetGrouped)
                    .scrollContentBackground(.hidden)
                }
            }
           
        }
    }
 
    
    
    struct SettingsViewController_Previews: PreviewProvider {
        static var previews: some View {
            SettingsViewController()
        }
    }
}
