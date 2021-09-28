//
//  ViewControllerRepresentation.swift
//  RockPaperScissors
//
//  Created by Huey Bai on 27/9/21.
//

import SwiftUI

struct ViewControllerRepresentation: UIViewControllerRepresentable {
   typealias UIViewControllerType = ViewController
//    @Binding var isPresented: Bool
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(isPresented: $isPresented)
//    }
//
//    class Coordinator: NSObject{
//        @Binding var isPresent: Bool
//        @Environment(\.presentationMode) var presentationMode
//
//        init(isPresented: Binding<Bool>) {
//            self._isPresent = isPresented
//        }
//        @objc func isPresentedChanged(_ sender: ViewControllerRepresentation.UIViewControllerType){
//            self.isPresent = false
//        }
//    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerRepresentation>) -> ViewControllerRepresentation.UIViewControllerType {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AR") as! ViewController
  }
      
    func updateUIViewController(_ uiViewController: ViewControllerRepresentation.UIViewControllerType, context: UIViewControllerRepresentableContext<ViewControllerRepresentation>) {
//        uiViewController.backButton.addTarget(context.coordinator, action: #selector(Coordinator.isPresentedChanged(_:)), for: .touchUpInside)
    }
    
//    static func dismantleUIViewController(_ uiViewController: Self.UIViewControllerType, coordinator: Self.Coordinator){
//
//    }
}

