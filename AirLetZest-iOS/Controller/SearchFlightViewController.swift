//
//  SearchFlightViewController.swift
//  AirLetZest-iOS
//
//  Created by BOONGKI KWAK on 2023/02/24.
//

import UIKit

class SearchFlightViewController: UIViewController {
    
    // IB Outlets
    @IBOutlet weak var departTextField: UITextField!
    @IBOutlet weak var arrivalTextField: UITextField!
    @IBOutlet var textLabelCollection: [UILabel]!
    @IBOutlet weak var textLabelHeader: UILabel!
    @IBOutlet weak var waySegmentControl: UISegmentedControl!
    @IBOutlet weak var searchButton: UIButton!
    
    // Property
    let customFont = "SingleDay-Regular"
    let fontLargeSize = 30.0
    let fontMediumSize = 20.0
    let fontRegularSize = 14.0
    var searchCityController: SearchCityController = SearchCityController()
    
    // Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        departTextField.delegate = self
        arrivalTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    // IB Action
    // depart / arrival 텍스트필드 선택시 아래에 모달 띄어주기
    @IBAction func showDeparts(_ sender: Any) {
        print("departTextField Tapped")
        
//        let searchVC = self.storyboard?.instantiateViewController(withIdentifier: SearchVC.identifier) as! SearchVC
//
//        searchVC.modalPresentationStyle = .overCurrentContext
//        searchVC.providesPresentationContextTransitionStyle = true
//        searchVC.definesPresentationContext = true
//        searchVC.modalTransitionStyle = .crossDissolve
//        searchVC.view.layer.cornerRadius = 10
//
//        self.present(searchVC, animated: true, completion: nil)
    }
    @IBAction func searchButtonTapped(_ sender: Any) {
        searchCityController.searchCities()
    }
    
    
}





