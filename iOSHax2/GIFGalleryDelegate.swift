//
//  GIFGalleryDelegate.swift
//  iOSHax2
//
//  Created by George Hsin on 11/14/16.
//  Copyright © 2016 George Hsin. All rights reserved.
//

import Foundation
protocol GIFGalleryDelegate: class {
    func gifViewController(controller: GIFGalleryController, gifarray: AnyObject, indexPath: Int)
}
