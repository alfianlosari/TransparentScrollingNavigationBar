//
//  ViewController.swift
//  ScrollingParalax2
//
//  Created by Alfian Losari on 18/09/17.
//  Copyright © 2017 Alfian Losari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var navigationBar: UINavigationBar!
	
	@IBOutlet weak var tableView: UITableView!
	override func viewDidLoad() {
		super.viewDidLoad()
		setupTransparent()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		self.tableView.contentInset.top = -view.safeAreaInsets.top
		self.tableView.scrollIndicatorInsets.top = -view.safeAreaInsets.top
	}
	
	func setupTransparent() {
		navigationBar.setBackgroundImage(UIImage(), for: .default)
		navigationBar.shadowImage = UIImage()
		navigationBar.barTintColor = nil
		navigationBar.tintColor = nil
		navigationBar.isTranslucent = true
		navigationBar.backgroundColor = .clear
		navigationBar.alpha = 1.0
	}
	
	func setupNormal(alpha: CGFloat) {
		navigationBar.setBackgroundImage(nil, for: .default)
		navigationBar.shadowImage = UIImage()
		navigationBar.barTintColor = UIColor(red: 55/255, green: 160/255, blue: 244/255, alpha: 0)
		navigationBar.alpha = alpha
		navigationBar.tintColor = nil
		navigationBar.isTranslucent = true
		navigationBar.backgroundColor = nil
	}
	
	
	
	var topArea: CGFloat {
		return view.safeAreaInsets.top + self.navigationBar.frame.height
		
	}
}

extension ViewController: UITableViewDelegate, UITableViewDataSource  {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 20
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		return cell
	}
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		print("Offset Y")
		print(scrollView.contentOffset.y)
		print("Top Area")
		print(topArea)
		// Percentage Offset
		let percentage =  min(max(0, (scrollView.contentOffset.y - topArea) / 100), 1)
		print("Percentage")
		print(percentage)
		if percentage > 0 {
			self.setupNormal(alpha: percentage)
		} else {
			self.setupTransparent()

		}
	}
	
}
