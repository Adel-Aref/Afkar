//
//  HelpingMethod.swift
//  Afkar
//
//  Created by Other user on 6/13/18.
//  Copyright © 2018 Other user. All rights reserved.
//

import Foundation

import  UIKit
class HelpingMethods
{
    static func showActivityIndicator(myView:UIView)-> UIActivityIndicatorView
    {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
                activityIndicator.center = myView.center
                activityIndicator.color = #colorLiteral(red: 0, green: 0.7357301712, blue: 0.9509622455, alpha: 1)
                activityIndicator.startAnimating()
                myView.addSubview(activityIndicator)

        return activityIndicator
    }
    ///////
    static func removeActivityIndicator(activityIndicator:UIActivityIndicatorView)
    {

            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()

        
    }
 // End of the class
}
