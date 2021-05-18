//
//  SetProfileViewController.swift
//  DermitologyApplication
//
//  Created by techjini on 26/04/21.
//  Copyright © 2021 techjini. All rights reserved.
//

import UIKit
import CoreLocation
import DropDown


class SetProfileViewController: UIViewController, UITextViewDelegate, CLLocationManagerDelegate{
    
    //MARK:- Outlets for UIComponents.
    
    @IBOutlet weak var SetupScroll: UIScrollView!
    
    
    @IBOutlet weak var SetupView: UIView!
    
    @IBOutlet weak var NavigationView: UIView!
    
    @IBOutlet weak var NavigationStack: UIStackView!
    
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var lblSetup: UILabel!
    
    @IBOutlet weak var RegStack: UIStackView!
    
    @IBOutlet weak var lblFirst: UILabel!
    
    @IBOutlet weak var txtFirst: UITextField!
    
    @IBOutlet weak var lblLast: UILabel!
    
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var txtLast: UITextField!
    
    @IBOutlet weak var SelectionStack: UIStackView!
    
    @IBOutlet weak var MaleView: UIView!
    
    @IBOutlet weak var imgSelected: UIImageView!
    
    @IBOutlet weak var imgMale: UIImageView!
    @IBOutlet weak var btnMale: UIButton!
    
    @IBOutlet weak var FemaleSelected: UIImageView!
    
    @IBOutlet weak var FemaleView: UIView!
    
    @IBOutlet weak var imgFemale: UIImageView!
    
    @IBOutlet weak var btnFemale: UIButton!
    
    @IBOutlet weak var OtherView: UIView!
    
    @IBOutlet weak var OtherSelected: UIImageView!
    
    @IBOutlet weak var imgOther: UIImageView!
    
    @IBOutlet weak var btnOther: UIButton!
    
    @IBOutlet weak var infoStack: UIStackView!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var txtDate: UITextField!
    
    @IBOutlet weak var lblBlood: UILabel!
    
    
    @IBOutlet weak var DropDownView: UIView!
    
    @IBOutlet weak var txtBlood: UITextField!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    
    @IBOutlet weak var imgLocation: UIImageView!
    
    @IBOutlet weak var btnLocation: UIButton!
    
    @IBOutlet weak var txtAddress: UITextView!
    
    @IBOutlet weak var lblInsur: UILabel!
    
    @IBOutlet weak var txtInsur: UITextField!
    
    @IBOutlet weak var lblContact: UILabel!
    
    @IBOutlet weak var txtContact: UITextField!
    
    @IBOutlet weak var lblNumber: UILabel!
    
    @IBOutlet weak var txtNumber: UITextField!
    
    @IBOutlet weak var lblNote: UILabel!
    
    @IBOutlet weak var lblCreateAccount: UILabel!
    
    
    @IBOutlet weak var btnCreate: UIButton!
    
    @IBOutlet weak var lblContactError: UILabel!
    let datePicker = UIDatePicker()
    var iconClick = false
    
    let formatter = DateFormatter()
    
    var locationManager: CLLocationManager!
    
    var validPhone = false
    var validFirstName = false
    var valilidLastName = false
    var validRelationship = false
    var validGender = false
    var validEName = false
    var validInsurance = false
    var activeTextField : UITextField? = nil
    override func viewDidLoad() {
        
        super.viewDidLoad()
    IQKeyboardManager.shared.enable = false
        txtAddress.delegate = self
        txtFirst.delegate = self
        txtLast.delegate = self
        txtBlood.delegate = self
        txtAddress.delegate = self
        txtDate.delegate = self
        txtInsur.delegate = self
        txtContact.delegate = self
        txtNumber.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(SetProfileViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // call the 'keyboardWillHide' function when the view controlelr receive notification that keyboard is going to be hidden
        NotificationCenter.default.addObserver(self, selector: #selector(SetProfileViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        applyDesign()
     NotificationCenter.default.addObserver(self, selector: #selector(loadSignUpSuccessView), name: NSNotification.Name(rawValue: "loadSignUpSuccessViewController"), object: nil)
        
        // Getting user permision for accessing location
        btnLocation.addTarget(self, action: #selector(Enable), for: .touchUpInside)
        btnCreate.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
        self.txtDate.setInputViewDatePicker(target: self, selector: #selector(tapDone))
    }
    
    //MARK:- Check location permission.
    func checkPermission() {
        switch  CLLocationManager.authorizationStatus() {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            showAlert(withTitle: "Error", message: "Location access restricted from Parent control")
        case .denied:
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let setting = UIAlertAction(title: "Settings", style: .default) { (action) in
                if let url = URL(string: UIApplication.openSettingsURLString){
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
            showAlert(withTitle: "Select", message: "Location access denied. Please allow it from settings", Actions: [setting,cancel])
            
        case .authorizedAlways,.authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            showAlert(withTitle: "Error ", message: "Something went wrong")
            
            
        }
        
    }
    
    func showAlert(withTitle title: String?,message: String?, Actions:[UIAlertAction] = [UIAlertAction(title: "OK", style: .default, handler: nil)]){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        Actions.forEach({alert.addAction($0)})
        present(alert,animated: true,completion: nil)
    }
    
    //MARK:- Hiding navigationbar from view controller.
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @objc func tapDone() {
        if let datePicker = self.txtDate.inputView as? UIDatePicker{
            formatter.timeStyle = .none
            formatter.dateFormat = "dd-MM-yyyy"
            
            self.txtDate.text = formatter.string(from: datePicker.date)
        }
        self.txtDate.resignFirstResponder()
    }
    
    
    @IBAction func firstNameaCTION(_ sender: UITextField) {
        checkFirstName()
    }
    
    @IBAction func lastNameAction(_ sender: Any) {
        checkLastName()
    }
    @IBAction func bloodgroup(_ sender: UITextField) {
        //checkBlood()
    }
    @IBAction func insuranceAction(_ sender: UITextField) {
        checkInsurance()
    }
    @IBAction func emergancyName(_ sender: UITextField) {
        checkEmerganceName()
    }
    @IBAction func datOfBirthAction(_ sender: UITextField) {
        //checkDOB()
    }
    
    @IBAction func btnBack1(_ sender: UIButton) {
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController: ViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(viewController, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func phoneChanged(_ sender: UITextField) {
        checkPhone()
        
    }
    
    
    //MARK:- Calender button inside Date of birth textfield.
    func setIcon1(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 0, y: 0, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: -10, y: 0, width: 40, height: 30))
        iconContainerView.addSubview(iconView)
        
        
        txtDate.rightView = iconContainerView
        txtDate.rightViewMode = .always
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(iconClicked1(tapGestureRecognizer:)))
        iconView.isUserInteractionEnabled = true
        iconView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    @objc func iconClicked1(tapGestureRecognizer: UITapGestureRecognizer){
        
        
        createDatePicker()
        
    }
    
    //MARK:- Creating DatePicker.
    
    
    func createDatePicker() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.barStyle = .default
        
        let Done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([Done], animated: true)
        txtDate.inputAccessoryView = toolBar
        txtDate.inputView = datePicker
        datePicker.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        datePicker.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        datePicker.datePickerMode = .date
    }
    
    @objc func donePressed() {
        
        formatter.timeStyle = .none
        formatter.dateFormat = "dd-MM-yyyy"
        
        txtDate.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
        
    }
    
    
    func setIcon2(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 0, y: 0, width: 20, height: 20))
        iconView.image = image
        
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: -10, y: 0, width: 40, height: 30))
        iconContainerView.addSubview(iconView)
        
        
        txtBlood.rightView = iconContainerView
        txtBlood.rightViewMode = .always
        IQKeyboardManager.shared.enable = false
        
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(iconClicked2(tapGestureRecognizer:)))
        iconView.isUserInteractionEnabled = true
        iconView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    @objc func iconClicked2(tapGestureRecognizer: UITapGestureRecognizer){
        //  let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        let dropDown = DropDown()
        
        
        // The view to which the drop down will appear on
        dropDown.anchorView = DropDownView // UIView or UIBarButtonItem
        
        
        
        let Blood = ["A+","A-" ,"B+","B-", "AB+","AB-","O+","O-"]
        
        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = Blood
        
        // Top of drop down will be below the anchorView
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        
        // When drop down is displayed with `Direction.top`, it will be above the anchorView
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.txtBlood.text = Blood[index]
        }
        
        dropDown.show()
        dropDown.direction = .bottom
        
    }
    //MARK:- Customizing UIComponents.
    
    func applyDesign() {
        
        
        
        self.imgSelected.isHidden = true
        self.FemaleSelected.isHidden = true
        self.OtherSelected.isHidden = true
        
        setIcon1(UIImage(named: "Shape")!)
        setIcon2(UIImage(named: "Drop")!)
        txtDate.textColor = #colorLiteral(red: 0.007843137255, green: 0.07058823529, blue: 0.1725490196, alpha: 1)
        txtBlood.textColor = #colorLiteral(red: 0.007843137255, green: 0.07058823529, blue: 0.1725490196, alpha: 1)
        
        txtDate.tintColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
        txtBlood.tintColor = #colorLiteral(red: 0.4549019608, green: 0.6078431373, blue: 0.6784313725, alpha: 1)
        
        //Specifieng border color and width to the address textview up button.
        txtAddress.layer.borderWidth = 1
        txtAddress.layer.borderColor = #colorLiteral(red: 0.8, green: 0.8156862745, blue: 0.8352941176, alpha: 1)
        txtAddress.toolbarPlaceholder = "Enter the address"
        
        txtAddress.textColor = #colorLiteral(red: 0.007843137255, green: 0.07058823529, blue: 0.1725490196, alpha: 1)
        
        //Corner radius for male, female, oher views.
        MaleView.layer.borderWidth = 1
        MaleView.layer.borderColor = #colorLiteral(red: 0.07843137255, green: 0.2274509804, blue: 0.2980392157, alpha: 0.3)
        
        MaleView.layer.cornerRadius = 20
        MaleView.layer.masksToBounds = true
        MaleView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        
        FemaleView.layer.borderWidth = 1
        FemaleView.layer.borderColor = #colorLiteral(red: 0.07843137255, green: 0.2274509804, blue: 0.2980392157, alpha: 0.3)
        FemaleView.layer.cornerRadius = 20
        FemaleView.layer.masksToBounds = true
        FemaleView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        
        
        OtherView.layer.borderWidth = 1
        OtherView.layer.borderColor = #colorLiteral(red: 0.07843137255, green: 0.2274509804, blue: 0.2980392157, alpha: 0.3)
        OtherView.layer.cornerRadius = 20
        OtherView.layer.masksToBounds = true
        OtherView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
        
        
    }
    
    //MARK:- textview delegation.
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == #colorLiteral(red: 0.007843137255, green: 0.07058823529, blue: 0.1725490196, alpha: 0.2040346747) {
            textView.text = nil
            textView.textColor = #colorLiteral(red: 0.007843137255, green: 0.07058823529, blue: 0.1725490196, alpha: 1)
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.toolbarPlaceholder = "Please Enter Address"
            textView.textColor = #colorLiteral(red: 0.007843137255, green: 0.07058823529, blue: 0.1725490196, alpha: 0.2040346747)
        }
        else{
            textView.textColor = #colorLiteral(red: 0.007843137255, green: 0.07058823529, blue: 0.1725490196, alpha: 1)
        }
    }
    
    //MARK:-Gender Selection.
    
    
    @IBAction func btnMaleClick(_ sender: UIButton) {
        self.imgSelected.isHidden = false
        //  btnFemale.isEnabled = false
        // btnOther.isEnabled = false
        Varification.shared.gender = "male"
        MaleView.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.7490196078, blue: 0.7215686275, alpha: 1)
        if self.OtherSelected.isHidden == false || self.FemaleSelected.isHidden == false {
            self.OtherSelected.isHidden = true
            self.FemaleSelected.isHidden = true
            OtherView.backgroundColor = .clear
            FemaleView.backgroundColor = .clear
            
        }
    }
    
    @IBAction func btnFemClick(_ sender: UIButton) {
        self.FemaleSelected.isHidden = false
        //btnMale.isEnabled = false
        //btnOther.isEnabled = false
        FemaleView.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.7490196078, blue: 0.7215686275, alpha: 1)
        Varification.shared.gender = "female"
        
        if self.imgSelected.isHidden == false || self.OtherSelected.isHidden == false {
            self.imgSelected.isHidden = true
            self.OtherSelected.isHidden = true
            MaleView.backgroundColor = .clear
            OtherView.backgroundColor = .clear
        }
        
    }
    
    @IBAction func btnOtherClick(_ sender: UIButton) {
        self.OtherSelected.isHidden = false
        // btnMale.isEnabled = false
        // btnFemale.isEnabled = false
        OtherView.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.7490196078, blue: 0.7215686275, alpha: 1)
        Varification.shared.gender = "other"
        if self.imgSelected.isHidden == false || self.FemaleSelected.isHidden == false {
            self.imgSelected.isHidden = true
            self.FemaleSelected.isHidden = true
            MaleView.backgroundColor = .clear
            FemaleView.backgroundColor = .clear
        }
        
    }
    @IBAction func btnPrev(_ sender: UIButton) {
        let signupViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        self.present(signupViewController!, animated: true, completion: nil)
    }
    
    
    
    @objc func createAccount() {
        
        guard  let inputPhone = txtNumber.text else { return }
        
        txtNumber.text = inputPhone
        print(txtFirst.text!)
        print(txtLast.text!)
        print(Varification.shared.gender)
        print(txtBlood.text!)
        print(txtDate.text!)
        print(txtInsur.text!)
        print(txtAddress.text!)
        print(txtContact.text!)
        print(txtNumber.text!)
        formatter.timeStyle = .none
        formatter.dateFormat = "MM-dd-yyyy"
        
        //let Dob = formatter.date(from: txtDate.text!)
        //print(Dob!)
        CreateAPI.shared.setupPostMethod(Fname: txtFirst.text!, Lname: txtLast.text!, Gender: Varification.shared.gender, DBirth: txtDate.text!, Bgroup:txtBlood.text!, address: txtAddress.text!, Insur: txtInsur.text!, Ename: txtContact.text!, Enumber: txtNumber.text!, deviceID: SystemVerification.shared.deviceId, tokenId: SystemVerification.shared.tokenId)
    }
    @objc func loadSignUpSuccessView(notification: NSNotification){
        let signInViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignUpSuccessViewController") as? SignUpSuccessViewController
        self.present(signInViewController!, animated: true, completion: nil)
        
    }
    
    
    
    //MARK:- Getting user address.
    
    func getAddress(fromLocation location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                self.showAlert(withTitle: "Error", message: error.localizedDescription)
            } else if let placeMarks = placemarks {
                for placemark in placeMarks {
                    let address = [placemark.name,placemark.subThoroughfare,placemark.locality,placemark.country,placemark.postalCode] .compactMap({$0}).joined(separator: ",")
                    print(address)
                    self.txtAddress.text = address
                    self.txtAddress.textColor = #colorLiteral(red: 0.004298632964, green: 0.09601455182, blue: 0.2277887464, alpha: 0.2)
                }
            }
        }
        
    }
    
    
    //MARK:- Use current location Button.
    @objc func Enable() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        checkPermission()
    }
    
    
    
    //MARK:- CLLocation delegate method.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkPermission()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        showAlert(withTitle: "Error", message: error.localizedDescription)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            getAddress(fromLocation: location)
        }
    }
}
