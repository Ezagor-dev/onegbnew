//
//  SafariViewController.swift
//  onegb
//
//  Created by Ezagor on 11.12.2023.
//

import Foundation
import SwiftUI
import SafariServices

struct SafariViewController: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariViewController = SFSafariViewController(url: url)
        return safariViewController
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}
