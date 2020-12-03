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
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var buisnessViewTapped: UIView!
    @IBOutlet weak var deliverdByBuisnessTapped: UIView!
    
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "PopularDealsTableViewCell", bundle: nil), forCellReuseIdentifier: "PopularDealsTableViewCell")
        textView.delegate = self
        
        
        
        let buisnessViewClick = UITapGestureRecognizer(target: self, action: #selector(buisnessViewtap))
        buisnessViewTapped.addGestureRecognizer(buisnessViewClick)
        
        perpareNavigation(txtTitle: "Phajja Siri paye", leftImage: UIImage(named: "Back"), rightImage: nil)
        navigationOfVc()
        
        
        let deliverdByBuisnessClick = UITapGestureRecognizer(target: self, action: #selector(deliverdbuisnessViewtap))
        deliverdByBuisnessTapped.addGestureRecognizer(deliverdByBuisnessClick)
    }
    
    
    func navigationOfVc() {
        let search    = UIImage(named: "SearchRed")!
         let share  = UIImage(named: "Share")!

        let searchButton   = UIBarButtonItem(image: search,  style: .plain, target: self, action: #selector(searchBtnTapped))
        let shareButton = UIBarButtonItem(image: share,  style: .plain, target: self, action: #selector(shareBtnTapped))

         navigationItem.rightBarButtonItems = [searchButton, shareButton]
    }
    
    @objc func deliverdbuisnessViewtap() {
        
    }
    
    @objc func searchBtnTapped() {
        
    }
    @objc func shareBtnTapped() {
        
    }
    
    
    @objc func buisnessViewtap() {
        pushToController(from: .main, identifier: .BuisnessInformationTableViewController)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.navigationBar.isHidden = true
//        //        descriptionLabelSet()
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.navigationBar.isHidden = false
//    }
    
    
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
    
    @IBAction func backBtnTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularDealsTableViewCell") as! PopularDealsTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
    
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
        headerView.textLabel?.textColor = UIColor(named: "SectionsColor")
        let myView = UIView()
        headerView.textLabel?.text =  headerView.textLabel?.text?.capitalized
        headerView.textLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 15)
        headerView.textLabel?.textColor = UIColor(named: "Default")
        myView.backgroundColor = UIColor(named: "Background")
        headerView.backgroundView = myView
    }
    
}
