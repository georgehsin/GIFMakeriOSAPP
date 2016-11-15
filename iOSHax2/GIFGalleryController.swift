//
//  GIFGalleryController.swift
//  iOSHax2
//
//  Created by George Hsin on 11/14/16.
//  Copyright © 2016 George Hsin. All rights reserved.
//

import Foundation
import UIKit
class GIFGalleryController: UITableViewController, CancelButtonDelegate{
    weak var cancelButtonDelegate: CancelButtonDelegate?
    func cancelButtonPressedFrom(controller: UIViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var GIFPreview: UIImageView!
    
    var gifArray: [Array<UIImage>]?
//    var viewindexpath: Int?
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell")!
        cell.imageView?.image = gifArray![indexPath.row][0]
//        GIFPreview.animationImages = gifArray![indexPath.row]
//        GIFPreview.animationDuration = 1
//        GIFPreview.startAnimating()
        return cell
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gifArray!.count
    }
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        cancelButtonDelegate?.cancelButtonPressedFrom(self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "displayGIF" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! DisplayGIFController
            controller.cancelButtonDelegate = self
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) {
//              controller.viewindexpath = indexPath.row
                controller.gifArray = gifArray![indexPath.row]
            }
        }
    }
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("displayGIF", sender: tableView.cellForRowAtIndexPath(indexPath))
    }

//    func gifViewController(controller: GIFGalleryController, gifarray: AnyObject, indexPath: Int) {
//        
//    }

    
}
