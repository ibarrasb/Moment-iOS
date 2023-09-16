//
//  LikedByView.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 9/16/23.
//

import SwiftUI

struct LikedByView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var likedBy: [postLikedBy]
    
    var body: some View {
        
        VStack{
            HStack {
                // Custom back button
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left") // You can use any back arrow image here
                        .foregroundColor(.blue)
                        .padding(.leading, 16)
                }
                
                Spacer()
                
                Text("Comments")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.leading, -35)
                Spacer()
            }
            .frame(height: 44)
            List {
                ForEach(likedBy) { likes in
                    VStack(alignment: .leading) {
                        Text(likes.username)
                            .font(.headline)
                        Text(likes.profilePicture)
                            .font(.body)
                    }
                }
            }
        }
    }
}
let sampleLikes = [
    postLikedBy(username: "JaneDoe", profilePicture: "Beautiful photo!"),
    postLikedBy(username: "Alice", profilePicture: "Nice caption!")
        ]



struct LikedByView_Previews: PreviewProvider {
    static var previews: some View {
        LikedByView(likedBy: sampleLikes)
    }
}
