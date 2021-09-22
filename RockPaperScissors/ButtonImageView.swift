//
//  buttonView.swift
//  RockPaperScissors
//
//  Created by Huey Bai on 22/9/21.
//

import SwiftUI

struct ButtonImageView: View {
    var image:String
    var body: some View {
        Image(image)
            .clipShape(Circle())
            .shadow(radius: 10)
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 150, maxWidth: 50, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 150, alignment: .center)
            .scaleEffect(0.5)
    }
    
    init(image:String){
        self.image = image
    }
}

struct buttonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonImageView(image: "solo")
    }
}
