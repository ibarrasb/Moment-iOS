//
//  CommentsView.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 9/13/23.
//

import SwiftUI

struct CommentsView: View {
    var comments: [ProfileComment]
    
    var body: some View {
        List {
            ForEach(comments) { comment in
                VStack(alignment: .leading) {
                    Text(comment.username)
                        .font(.headline)
                    Text(comment.text)
                        .font(.body)
                }
            }
        }
    }
}
let sampleComments = [
            ProfileComment(username: "JaneDoe", text: "Beautiful photo!"),
            ProfileComment(username: "Alice", text: "Nice caption!")
        ]



struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(comments: sampleComments)
    }
}
