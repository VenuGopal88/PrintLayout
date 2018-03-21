//
//  printLayout.swift
//  printerDemo
//
//  Created by Gupta, Venu Gopal on 21/03/18.
//  Copyright © 2018 . All rights reserved.
//

import Foundation
import UIKit


class printLayout: UIView {
	
	/*override init(frame: CGRect) {
		super.init(frame: frame)
		loadView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		loadView()
	}*/
	
	func loadView() -> UIView {
			
		let bundle = Bundle(for: type(of: self))
		let nib = UINib(nibName: "printLayout", bundle: bundle)
		if let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView {
			return view
			/*view.frame = bounds
			view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
			view.backgroundColor = UIColor.clear
			addSubview(view)
			*/
		}
	}
}


