//
//  MainMenuView.swift
//  RockPaperScissors
//
//  Created by Huey Bai on 21/9/21.
//

import SwiftUI

struct MainMenuView: View {
    let feedback = UIImpactFeedbackGenerator(style: .rigid)
    @State private var tempAlert = false
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Button(action: {
                    feedback.impactOccurred()
                }){
                    ButtonImageView(image: "solo")
                }
                .offset(x: 0, y: -50)
                
                //Duo Button
                Button(action: {
                    feedback.impactOccurred()
                    self.tempAlert = true
                }){
                    ButtonImageView(image: "duo")
                }
                .alert(isPresented: $tempAlert) {
                    Alert(title: Text("Prompt"), message: Text("The multiplayer game is currently not completed, so stay tuned!"), dismissButton: .default(Text("OK")))
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
