//
//  SearchFlightViewController+Style.swift
//  AirLetZest-iOS
//
//  Created by BOONGKI KWAK on 2023/02/25.
//

import UIKit

extension SearchFlightViewController {
    
    func style() {
        let largeFont = UIFont(name: customFont, size: fontLargeSize)
        let mediumFont = UIFont(name: customFont, size: fontMediumSize)
        let regularFont = UIFont(name: customFont, size: fontRegularSize)
        
        textLabelHeader.font = largeFont
        for textlabel in textLabelCollection{
            textlabel.font = regularFont
        }
        
        let attributedSegmentFont = NSDictionary(object: regularFont!, forKey: NSAttributedString.Key.font as NSCopying)
        waySegmentControl.setTitleTextAttributes(attributedSegmentFont as [NSObject : AnyObject] as [NSObject : AnyObject] as? [NSAttributedString.Key : Any], for: .normal)
        
        searchButton.titleLabel?.font = mediumFont
        searchButton.layer.cornerRadius = 25
        
    }
    
}
