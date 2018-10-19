//
//  WebViewDisplayFunction.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Yongnan Piao on 10/19/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    // MARK: - Web View Set Up
    func setupWebView() {
        setupWebViewContainer()
        setupWebViewBar()
        setupWebpageView()
        setupCloseWebButton()
        webViewContainer.isHidden = true
    }
    
    // MARK: - Web View Container
    func setupWebViewContainer() {
        view.addSubview(webViewContainer)
        webViewContainer.backgroundColor = .webbarBackGroundColor
        webViewContainer.translatesAutoresizingMaskIntoConstraints = false
        webViewContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        webViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // MARK: - Web View Bar
    func setupWebViewBar() {
        webViewContainer.addSubview(webViewBar)
        webViewBar.translatesAutoresizingMaskIntoConstraints = false
        webViewBar.topAnchor.constraint(equalTo: webViewContainer.topAnchor, constant: 20).isActive = true
        webViewBar.leadingAnchor.constraint(equalTo: webViewContainer.leadingAnchor).isActive = true
        webViewBar.trailingAnchor.constraint(equalTo: webViewContainer.trailingAnchor).isActive = true
        webViewBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // MARK: - Webpage View
    func setupWebpageView() {
        webpageView.translatesAutoresizingMaskIntoConstraints = false
        webViewContainer.addSubview(webpageView)
        webpageView.topAnchor.constraint(equalTo: webViewBar.bottomAnchor).isActive = true
        webpageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        webpageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webpageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // MARK: - Close Web Button
    func setupCloseWebButton() {
        webViewContainer.addSubview(closeWebButton)
        closeWebButton.topAnchor.constraint(equalTo: webViewBar.topAnchor).isActive = true
        closeWebButton.trailingAnchor.constraint(equalTo: webViewContainer.trailingAnchor).isActive = true
        closeWebButton.heightAnchor.constraint(equalTo: webViewBar.heightAnchor).isActive = true
        closeWebButton.widthAnchor.constraint(equalTo: webViewBar.heightAnchor).isActive = true
    }
    
    // The function used by 'closeWebButton'.
    func closeWebView() {
        webViewContainer.isHidden = true
    }
}
