//
//  RegisterTableViewController.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 25/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit

class RegisterTableViewController: UITableViewController  {
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var emailAddressLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var confirmPassLabel: UITextField!
    @IBOutlet weak var phoneNoLabel: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    
    //MARK: - Variables
    
    let bottomBtn = UIButton(type: .system)
    var imagePicker = UIImagePickerController()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.roundedImage()
        phoneNoLabel.delegate = self
        perpareNavigation(txtTitle: "Register with email", leftImage: UIImage(named: "Cross"), rightImage: nil)
        tableView.backgroundColor = UIColor(named: "Background")
        imagePicker.delegate = self
    }
    
    //when every thing is Loaded
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ScreenBottomView.goToNextScreen(button: bottomBtn, view: self.view, btnText: "Register with email")
        bottomBtn.addTarget(self, action: #selector(bottomBtnTapped), for: .touchUpInside)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
        window.viewWithTag(200)?.removeFromSuperview()
    }
    
    //MARK: - Functions
    
    @objc func bottomBtnTapped() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "LoginTableViewController") as! LoginTableViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    func navigationleftButton() {
        let leftButton = UIBarButtonItem(image: UIImage(named: "Cross")?.withRenderingMode(.alwaysOriginal), style: .plain, target: nil , action: nil)
        self.navigationItem.leftBarButtonItem = leftButton
    }
    
    
    
    //MARK: - IBActions
    
    @IBAction func emailValidation(_ sender: UITextField) {
        
    }
    @IBAction func countryBtnTapped(_ sender: UIButton) {
        let vc = CallingCodeVC()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func uploadPhotoBtnTapped(_ sender: UIButton) {
        uploadImage()
    }
}


// MARK: - UITextFieldDelegate

extension RegisterTableViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneNoLabel {
            let characterSet = NSCharacterSet(charactersIn:"0123456789").inverted
            let compSepByCharInSet = string.components(separatedBy: characterSet)
            let numberFiltered = compSepByCharInSet.joined(separator: "")
            return string == numberFiltered
        }
        return true
    }
    
    
}



extension RegisterTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 50
        }
        return 20
        
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = UIColor(named: "SectionsColor")
        let myView = UIView()
        headerView.textLabel?.text =  headerView.textLabel?.text?.capitalized
        headerView.textLabel?.font = UIFont(name: "SFUIText-Medium", size: 12)
        headerView.textLabel?.textColor = UIColor(named: "Default")
        myView.backgroundColor = UIColor(named: "Background")
        headerView.backgroundView = myView
    }
}


//MARK: - //MARK:-   UIImagePickerController delegate Methods
//For image picker we must be call protocol of "UIImagePickerControllerDelegate" and "UINavigationControllerDelegate".
extension RegisterTableViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    func uploadImage() {
        
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (_) in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Galary", style: .default, handler: { (_) in
            self.openGallary()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera() {
      if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func openGallary() {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        profileImage.isHidden = false
        profileImage.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
}





extension RegisterTableViewController: returnDataProtocol {
    func returnStringData(myData: String) {
        navigationController?.popViewController(animated: true)
        print(myData)
    }
}

