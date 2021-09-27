//
//  ViewControllerRepresentation.swift
//  RockPaperScissors
//
//  Created by Huey Bai on 27/9/21.
//

import SwiftUI

struct ViewControllerRepresentation: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
      
    @Binding var isDispaly:Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerRepresentation>) -> ViewControllerRepresentation.UIViewControllerType {
  //    return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "GameARView") as! ViewController
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AR") as! ViewController
        //TODO:
        
        return view
  }
      
    func updateUIViewController(_ uiViewController: ViewControllerRepresentation.UIViewControllerType, context: UIViewControllerRepresentableContext<ViewControllerRepresentation>) {
        uiViewController.isdisplay = self.isDispaly
    }
}

//struct ViewControllerRepresentation_Previews: PreviewProvider {
//    static var previews: some View {
//        var displayed:Binding<Bool> = true
//        ViewControllerRepresentation(isDispaly: displayed)
//    }
//}
