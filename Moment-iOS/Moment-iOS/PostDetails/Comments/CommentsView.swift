//
//  CommentsView.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 9/13/23.
//

import SwiftUI

struct CommentsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var comments: [ProfileComment]
    
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
                ForEach(comments) { comment in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(comment.username)
                            .font(.headline)
                        
                        Text(comment.text)
                            .font(.body)
                    }
                    
                }
            }
        }
    }
}
let sampleComments = [
            ProfileComment(username: "JaneDoe", text: "Beautiful photo!"),
            ProfileComment(username: "Alice", text: "Nice caption!"),
            ProfileComment(username: "JaneDoe", text: "Beautiful photo!"),
            ProfileComment(username: "Alice", text: "Nice caption!")
        ]



struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(comments: sampleComments)
    }
}
