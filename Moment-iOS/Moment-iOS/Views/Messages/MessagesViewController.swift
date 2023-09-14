//
//  MessagesViewController.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 9/1/23.
//

import SwiftUI

struct MessagesViewController: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.9).edgesIgnoringSafeArea(.all)
            Text("Messages")
        }
    }
}

struct MessagesViewController_Previews: PreviewProvider {
    static var previews: some View {
        MessagesViewController()
    }
}
