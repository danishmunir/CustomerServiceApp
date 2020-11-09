//
//  FoodDetailViewController.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 28/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit
import Security



class FoodDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "FastFoodTableViewCell", bundle: nil), forCellReuseIdentifier: "FastFoodTableViewCell")
        textView.delegate = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //        descriptionLabelSet()
    }
    
    
    func descriptionLabelSet(text: String) {
        if textView.textContainer.maximumNumberOfLines > 3 {
            
        }
        let str = NSMutableAttributedString(string: "\(text) more...")
        str.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: "more://",
            range: (str.string as NSString).range(of: "more..."))
        
        textView.attributedText = str
       
        textView.isSelectable = true
        textView.isEditable = false
        
        //        let readmoreFont = UIFont(name: "Helvetica-Bold", size: 12)
        //        let readmoreFontColor = UIColor.black
        //        DispatchQueue.main.async {
        //            self.descriptionLbl.addTrailing(with: "... ", moreText: "See more", moreTextFont: readmoreFont!, moreTextColor: readmoreFontColor)
        //        }
    }
}



extension FoodDetailViewController : UITextViewDelegate{
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if URL.scheme == "more" {
            print("More option pressed")
            return false
        }
        else {
            return true
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        if numberOfChars == 100 {
            descriptionLabelSet(text: newText)
        }
        return true   // 10 Limit Value
    }
}

extension FoodDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FastFoodTableViewCell") as! FastFoodTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return .leastNormalMagnitude
//    }
    

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Popular deals"
        } else if section == 1{ 
            return "Burgers"
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = .black
        
        let myView = UIView()
        
        headerView.textLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 15)
        myView.backgroundColor = UIColor(named: "F8F8FA")
        headerView.backgroundView = myView
       
    }
    
}
