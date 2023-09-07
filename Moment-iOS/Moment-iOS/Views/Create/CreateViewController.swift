//
//  CreateViewController.swift
//  Moment-iOS
//
//  Created by eduardo.ibarra on 9/1/23.
//

import SwiftUI

struct CreateViewController: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.8).edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                HStack {
                    Text("Moment")
                        .font(Font.custom("Bodoni 72 Smallcaps", size: 50))
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                }
            }
            .padding(.trailing, 216)
      
        }
        .padding(.top, -651)
    }
}

struct CreateViewController_Previews: PreviewProvider {
    static var previews: some View {
        CreateViewController()
    }
}
