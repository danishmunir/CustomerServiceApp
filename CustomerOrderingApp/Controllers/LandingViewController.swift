//
//  LandingViewController.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 27/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit
import CoreLocation

class LandingViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var searchandTextFiledView: UIView!
    @IBOutlet weak var DeliveryRectangleView: UIView!
    @IBOutlet weak var pickRectangleView: UIView!
    @IBOutlet weak var deliveryBtn: UIButton!
    @IBOutlet weak var pickupBtn: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var locationTextBtn: UIButton!
    @IBOutlet weak var filterBtn: UIButton!
    
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var trendingCollectionView: UICollectionView!
    
    let bottomButton = UIButton(type: .system)
    
    
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerCollectionView.register(UINib(nibName: "PaginationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PaginationCollectionViewCell")
        popularCollectionView.register(UINib(nibName: "PopularNearYouCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularNearYouCollectionViewCell")
        trendingCollectionView.register(UINib(nibName: "TrendingCatagoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TrendingCatagoriesCollectionViewCell")
        tableView.register(UINib(nibName: "FastFoodTableViewCell", bundle: nil), forCellReuseIdentifier: "FastFoodTableViewCell")
        
        filterBtn.tintColor =  UIColor(named: "primaryColor")
        
        let tapOnProfile = UITapGestureRecognizer(target: self, action: #selector(profileImgTapped(_:)))
        imgView.addGestureRecognizer(tapOnProfile)
        
        
        searchTextField.delegate = self
        searchandTextFiledView.layer.cornerRadius = 5
        imgView.roundedImage(image: imgView)
        
        
    }
    
    @objc func profileImgTapped(_ sender: UITapGestureRecognizer) {
        
        self.pushToController(from: .account, identifier: .MyAccountTableViewController)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        window.viewWithTag(201)?.removeFromSuperview()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ScreenBottomView.viewCartButton(button: bottomButton, view: self.view, btnText: "View Cart", cartLableTxt: "3", resultLabelTxt: "Rs. 50.00")
    }
    
    
    
    
    //MARK: IBActions
    @IBAction func deliveryBtnTapped(_ sender: Any) {
        DeliveryRectangleView.isHidden = false
        pickRectangleView.isHidden = true
        deliveryBtn.setTitleColor(.white, for: .normal)
        pickupBtn.setTitleColor(UIColor(named: "BtnColor"), for: .normal)
        pickupBtn.titleLabel!.font = UIFont(name: "HelveticaNeue", size: 12)
        deliveryBtn.titleLabel!.font = UIFont(name: "HelveticaNeue-Medium", size: 12)
        
    }
    
    @IBAction func pickupBtnTapped(_ sender: UIButton) {
        DeliveryRectangleView.isHidden = true
        pickRectangleView.isHidden = false
        deliveryBtn.setTitleColor(UIColor(named: "BtnColor"), for: .normal)
        pickupBtn.setTitleColor(.white, for: .normal)
        deliveryBtn.titleLabel!.font = UIFont(name: "HelveticaNeue", size: 12)
        pickupBtn.titleLabel!.font = UIFont(name: "HelveticaNeue-Medium", size: 12)
        
    }
    
    @IBAction func locationTextBtnTapped(_ sender: Any) {
        self.pushToController(from: .main, identifier: .DeliverDetailsTableViewController)
    }
    
    @IBAction func filterBtnTapped(_ sender: Any) {
        self.pushToController(from: .main, identifier: .FilterTableViewController)
    }
    
    @IBAction func trendingSeeAllBtnTapped(_ sender: Any) {
        self.pushToController(from: .main, identifier: .CatagoriesViewController)
    }
}



extension LandingViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc : CatagoriesViewController = storyBoard.instantiateViewController(withIdentifier: "CatagoriesViewController") as! CatagoriesViewController
        self.present(vc, animated: true, completion: nil)
    }
}


extension LandingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FastFoodTableViewCell") as! FastFoodTableViewCell
        return cell
    }
}

extension LandingViewController: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case bannerCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PaginationCollectionViewCell", for: indexPath) as! PaginationCollectionViewCell
            
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularNearYouCollectionViewCell", for: indexPath) as! PopularNearYouCollectionViewCell
            return cell
        case trendingCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingCatagoriesCollectionViewCell", for: indexPath) as! TrendingCatagoriesCollectionViewCell
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case bannerCollectionView:
            let width = (self.bannerCollectionView.frame.width)
            let height = (self.bannerCollectionView.frame.height - 10)
            return CGSize(width: width, height: height)
        case popularCollectionView:
            return CGSize(width: self.popularCollectionView.frame.width - 100 , height: self.popularCollectionView.frame.height - 10)
        case trendingCollectionView:
            return CGSize(width: 80, height: 80)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case bannerCollectionView:
            break
        case popularCollectionView:
            self.pushToController(from: .main, identifier: .FoodDetailViewController)
            break
        case trendingCollectionView:
            self.pushToController(from: .main, identifier: .FastFoodViewController)
        default:
            break
        }
    }
    
}
