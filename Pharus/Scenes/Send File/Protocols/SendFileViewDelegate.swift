//
//  SendFileViewDelegate.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation

protocol SendFileViewDelegate: AnyObject {
    func uploadButtonTapped()
    func sendFileButtonTapped()
    func closeButtonTapped()
}
