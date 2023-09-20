//
//  CommentsView.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 9/13/23.
//
import SwiftUI

struct ProfileComment: Identifiable {
    let id = UUID()
    var profilePicture: String // Specify the type as String
    var username: String
    var text: String
}

struct CommentsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var comments: [ProfileComment]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                HStack {
                    // Custom back button
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                            .padding(.leading, 16)
                    }
                    
                    Spacer()
                    
                    Text("\(comments.count) Comments")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.leading, -35)
                    Spacer()
                }
                .frame(height: 44)
                
                List {
                    ForEach(comments) { comment in
                        CommentRowView(comment: comment)
                    }
                    .listRowBackground(Color.black.opacity(0.9))
                }
                .listStyle(PlainListStyle())
                .frame(height: geometry.size.height - 44) // Adjust the height of the list
            }
            .background(Color.black)
        }
    }
}

struct CommentRowView: View {
    var comment: ProfileComment
    
    var body: some View {
        HStack {
            Button(action: {
                // Handle profile picture update
            }) {
                Image(comment.profilePicture)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 5)
            }
            .padding(.bottom, 10)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(comment.username)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(comment.text)
                    .font(.body)
                    .foregroundColor(.white)
            }
        }
        .listRowBackground(Color.black.opacity(0.9))
    }
}

let sampleComments = [
    ProfileComment(profilePicture: "eddiepic", username: "JaneDoe", text: "Beautiful photo!"),
    ProfileComment(profilePicture: "eddiepic", username: "Alice", text: "Nice caption!"),
    ProfileComment(profilePicture: "eddiepic", username: "JaneDoe", text: "Beautiful photo!"),
    ProfileComment(profilePicture: "eddiepic", username: "Alice", text: "Nice caption!")
]

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(comments: sampleComments)
    }
}
