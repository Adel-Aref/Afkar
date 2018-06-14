//
//  RootViewVCViewController.swift
//  Afkar
//
//  Created by Other user on 6/11/18.
//  Copyright © 2018 Other user. All rights reserved.
//

import UIKit

class RootViewVCViewController: UIViewController {
    
    let arrSideMenuItemsNames:[String] = ["1","2","3","4","5","6","7","8","9","10","11","12"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// extenion
extension RootViewVCViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
           return 6
        case 1:
             return 4
        case 2:
             return 1
        default:
            print("Otherwise, do something else.")
        }
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell")
                as? SideMenuCell else {return UITableViewCell()}
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell")
                as? SideMenuCell else {return UITableViewCell()}
            
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell")
                as? SideMenuCell else {return UITableViewCell()}
            
            return cell
        default:
            print("Otherwise, do something else.")
        }
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell")
                as? SideMenuCell else {return UITableViewCell()}

        return cell
    }
    // to select cell from table view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                guard let AboutCompny = storyboard?.instantiateViewController(withIdentifier: "AboutCompny") as? AboutCompny else {return}
                present(AboutCompny, animated: true, completion: nil)
            case 1:
                guard let AboutCompny = storyboard?.instantiateViewController(withIdentifier: "AboutCompny") as? AboutCompny else {return}
                present(AboutCompny, animated: true, completion: nil)
            case 2:
                guard let AboutCompny = storyboard?.instantiateViewController(withIdentifier: "AboutCompny") as? AboutCompny else {return}
                present(AboutCompny, animated: true, completion: nil)
            default:
                print("Otherwise, do something else.")
            }
        default:
            print("Otherwise, do something else.")
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    ///////////
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.7357301712, blue: 0.9509622455, alpha: 1)
        return view
    }
    // End of extenion
}
