//
//  ViewController.swift
//  printerDemo
//
//  Created by Gupta, Venu Gopal on 19/03/18.
//  Copyright © 2018 HTS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var imageToPrint: UIImageView!
	@IBAction func btnPrintClicked(_ sender: UIButton) {
		self.printImage()
	}
	
	func printImage() {
		
		let printController = UIPrintInteractionController.shared
		let printInfo = UIPrintInfo(dictionary: nil)
	
		printInfo.jobName = "Image print"
		printInfo.outputType = .photo
	
		printController.printInfo = printInfo
		//printController.printingItem = imageToPrint.image
		
		let objPrintView: UIView = Bundle.main.loadNibNamed("printLayout", owner: nil, options: nil)![0] as! UIView
		//let objPrintView = printLayout()
		printController.printingItem = objPrintView.toImage()
		
		
		printController.present(animated: true) { ( _ , isPrinted, error) in
			if error != nil {
				if isPrinted == true {
					print("image has been printed")
				} else {
					print("image has not been printed")
				}
			}
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

extension UIView {
	func toImage() -> UIImage {
		UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
		
		drawHierarchy(in: self.bounds, afterScreenUpdates: true)
		
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return image!
	}
}



