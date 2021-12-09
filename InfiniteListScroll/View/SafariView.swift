//
//  SafariView.swift
//  InfiniteListScroll
//
//  Created by Дмитрий Геращенко on 10.12.2021.
//

import SwiftUI
import SafariServices

struct SafariView : UIViewControllerRepresentable {
    
    var url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        let safariView = SFSafariViewController(url: url)
        safariView.preferredControlTintColor = UIColor.black
        return safariView
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
      
    }
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(url: URL(string: "https://github.com")!)
    }
}
