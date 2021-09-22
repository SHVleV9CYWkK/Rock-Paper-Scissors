//
//  MainMenuView.swift
//  RockPaperScissors
//
//  Created by Huey Bai on 21/9/21.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Button(action: {}){
                    ButtonImageView(image: "solo")
                }
                .offset(x: 0, y: -50)
                Button(action: {}){
                    ButtonImageView(image: "duo")
                }
                .offset(x: 0, y: 50)
            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
