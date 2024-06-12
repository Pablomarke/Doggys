//
//  MailView.swift
//  Doggys
//
//  Created by Marco Muñoz on 19/4/24.
//

import SwiftUI
import MessageUI

struct MailView: UIViewControllerRepresentable {
    @Binding var isShowing: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = context.coordinator
        mailComposeVC.setToRecipients(["doggysapp1@gmail.com"])
        mailComposeVC.setSubject("Contacto Doggys")
        return mailComposeVC
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, 
                                context: Context) {
    }
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        var parent: MailView
        
        init(_ parent: MailView) {
            self.parent = parent
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, 
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            parent.isShowing = false
        }
    }
}
