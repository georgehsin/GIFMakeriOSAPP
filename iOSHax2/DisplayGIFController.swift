//
//  DisplayGIFController.swift
//  iOSHax2
//
//  Created by George Hsin on 11/14/16.
//  Copyright © 2016 George Hsin. All rights reserved.
//

import Foundation
import UIKit
class DisplayGIFController: UIViewController {
    weak var cancelButtonDelegate: CancelButtonDelegate?
    var gifArray: [UIImage]?
//    var viewindexpath: Int?
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        cancelButtonDelegate?.cancelButtonPressedFrom(self)
    }
    @IBOutlet weak var GIFDisplay: UIImageView!
    
    override func viewDidLoad() {
        GIFDisplay.animationImages = gifArray
        GIFDisplay.animationDuration = 1
        GIFDisplay.startAnimating()
    }
    
    
    
}
