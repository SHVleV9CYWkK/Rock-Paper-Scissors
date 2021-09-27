//
//  ViewControllerRepresentation.swift
//  RockPaperScissors
//
//  Created by Huey Bai on 27/9/21.
//

import SwiftUI

struct ViewControllerRepresentation: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerRepresentation>) -> ViewControllerRepresentation.UIViewControllerType {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AR") as! ViewController
  }
      
    func updateUIViewController(_ uiViewController: ViewControllerRepresentation.UIViewControllerType, context: UIViewControllerRepresentableContext<ViewControllerRepresentation>) {
        
    }
}

struct ViewControllerRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentation()
    }
}
