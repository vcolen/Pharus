//
//  SendFileDelegate.swift
//  Pharus
//
//  Created by Victor Colen on 17/06/22.
//

import Foundation

protocol SendFileDelegate: AnyObject {
    func uploadButtonTapped()
    func sendFileButtonTapped()
    func closeButtonTapped()
}
