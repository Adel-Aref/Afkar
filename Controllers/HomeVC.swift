//
//  ViewController.swift
//  Afkar
//
//  Created by Other user on 6/9/18.
//  Copyright © 2018 Other user. All rights reserved.
//

import UIKit
import SideMenu
import Alamofire

struct Offer{
    
    var id:Int?
    var Name:String?
    var priceGuset:Int?
    var priceUser:Int?
    var photo:String?
    var stars:Int?
    var category_id:Int?
    var place_id : Int?
}
extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
class HomeVC: UIViewController {
    
    @IBOutlet weak var tableOffers: UITableView!
    static var errorMsg:String?
    var arrayOfOffers1:[Offer] = []
    var arrayOfOffers2:[Offer] = []
    var arrayOfOffers3:[Offer] = []
    var arrayOfOffers4:[Offer] = []
    var arrayOfOffers5:[Offer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menuLeftNamvigationController = storyboard?.instantiateViewController(withIdentifier: "RootViewVCViewController") as? UISideMenuNavigationController
        SideMenuManager.defaultManager.menuLeftNavigationController = menuLeftNamvigationController
        /////
        let menuRightNamvigationController = storyboard?.instantiateViewController(withIdentifier: "RootViewVCViewController") as? UISideMenuNavigationController
        SideMenuManager.defaultManager.menuRightNavigationController = menuRightNamvigationController
        //////////////
        getOffersFromNetwork()
        //////////////////
        //tableOffers.reloadData()
        // End of ViewDidLoad
    }
    //MARK:- getOffers API completion:@escaping(_ success:Bool , _ error:String?)-> Void
    func getOffersFromNetwork()
    {
       
        DispatchQueue.main.async {
             HelpingMethods.showActivityIndicator(myView: self.view)
            Alamofire.request("http://www.afkartourism.com/api/ShowallOfferstwenty", method:.post).responseJSON { (response) in
                switch response.result {
                case .success:
                    guard let json = response.result.value as? [[String:Any]] else {
                        HomeVC.errorMsg = "can't parse json"
                        print(response.result)
                        return
                    }
                    for item in json
                    {
                        for obj in (item["OfferEurope"] as? [[String:Any]])!
                        {
                            self.arrayOfOffers1.append(Offer(id: obj["id"] as? Int, Name: obj["Name"] as? String, priceGuset: obj["priceGuset"] as? Int, priceUser: obj["priceUser"] as? Int, photo:obj["photo"] as? String, stars: obj["stars"] as? Int, category_id: obj["category_id"] as? Int, place_id: obj["place_id"] as? Int))
                        }
                    }
                    ///////////////////
                    for item in json
                    {
                        for obj in (item["OfferAsi"] as? [[String:Any]])!
                        {
                            self.arrayOfOffers2.append(Offer(id: obj["id"] as? Int, Name: obj["Name"] as? String, priceGuset: obj["priceGuset"] as? Int, priceUser: obj["priceUser"] as? Int, photo:obj["photo"] as? String, stars: obj["stars"] as? Int, category_id: obj["category_id"] as? Int, place_id: obj["place_id"] as? Int))
                        }
                    }
                    //////////////////
                    for item in json
                    {
                        
                        for obj in (item["OfferAfrica"] as? [[String:Any]])!
                        {
                            self.arrayOfOffers3.append(Offer(id: obj["id"] as? Int, Name: obj["Name"] as? String, priceGuset: obj["priceGuset"] as? Int, priceUser: obj["priceUser"] as? Int, photo:obj["photo"] as? String, stars: obj["stars"] as? Int, category_id: obj["category_id"] as? Int, place_id: obj["place_id"] as? Int))
                        }
                    }
                    ///////////////////////
                    for item in json
                    {
                        
                        for obj in (item["OfferOther"] as? [[String:Any]])!
                        {
                            self.arrayOfOffers4.append(Offer(id: obj["id"] as? Int, Name: obj["Name"] as? String, priceGuset: obj["priceGuset"] as? Int, priceUser: obj["priceUser"] as? Int, photo:obj["photo"] as? String, stars: obj["stars"] as? Int, category_id: obj["category_id"] as? Int, place_id: obj["place_id"] as? Int))
                        }
                    }
                    DispatchQueue.main.async(execute: self.finishThread)
                case .failure :
                    print("Error" )
                }
            }
        }
    }
    func finishThread(){
        tableOffers.reloadData()
        let activity = HelpingMethods.showActivityIndicator(myView: self.view)
        HelpingMethods.removeActivityIndicator(activityIndicator: activity)
    }
    @IBAction func btnSideMenuPressed(_ sender: UIButton) {
        //present(SideMenuManager.default.menuLeftNavigationController!,animated:true,completion:nil)
    }
    // End of the class
    
}// extenion
extension HomeVC :UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return arrayOfOffers1.count
        case 1:
            return arrayOfOffers2.count
        case 2:
            return arrayOfOffers3.count
        case 3:
            return arrayOfOffers4.count
        default:
            print("Otherwise, do something else.")
        }
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "OfferEurope"
        case 1:
            return "OfferAsi"
        case 2:
            return "OfferAfrica"
        case 3:
            return "OfferOther"
        default:
            print("Otherwise, do something else.")
        }
        return "DEFAULT NAME SECTION"
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OferrCell")
            as? OferrCell else {return UITableViewCell()}
        
        if indexPath.section == 0
        {
            let urlString = "http://www.afkartourism.com/" + (arrayOfOffers1[indexPath.row].photo ?? "")
            let url = URL(string: urlString)
            cell.imgOffer.downloadedFrom(url: url!)
            cell.lblOfferName.text = arrayOfOffers1[indexPath.row].Name
            cell.lblPrice.text = String(describing: arrayOfOffers1[indexPath.row].priceGuset ?? 0)
        }
        else if indexPath.section == 1
        {
            let urlString = "http://www.afkartourism.com/" + (arrayOfOffers2[indexPath.row].photo ?? "")
            let url = URL(string: urlString)
            cell.imgOffer.downloadedFrom(url: url!)
            cell.lblOfferName.text = arrayOfOffers2[indexPath.row].Name
            cell.lblPrice.text = String(describing: arrayOfOffers2[indexPath.row].priceGuset ?? 0)
        }
        else if indexPath.section == 2
        {
            let urlString = "http://www.afkartourism.com/" + (arrayOfOffers1[indexPath.row].photo ?? "")
            let url = URL(string: urlString)
            cell.imgOffer.downloadedFrom(url: url!)
            cell.lblOfferName.text = arrayOfOffers3[indexPath.row].Name
            cell.lblPrice.text = String(describing: arrayOfOffers3[indexPath.row].priceGuset ?? 0)
        }
        else if indexPath.section == 3
        {
            let urlString = "http://www.afkartourism.com/" + (arrayOfOffers1[indexPath.row].photo ?? "")
            let url = URL(string: urlString)
            cell.imgOffer.downloadedFrom(url: url!)
            cell.lblOfferName.text = arrayOfOffers4[indexPath.row].Name
            cell.lblPrice.text = String(describing: arrayOfOffers4[indexPath.row].priceGuset ?? 0)
        }
        return cell
    }
    /////////////
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = UIView()
    headerView.backgroundColor = #colorLiteral(red: 0, green: 0.7357301712, blue: 0.9509622455, alpha: 1)
    return headerView
}
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 15
}
    //  End of Extenion
}

