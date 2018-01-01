//
//  ViewController.swift
//  JummpDemo
//
//  Created by venus on 12/30/17.
//  Copyright © 2017 Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var vwNavView: UIView!
    @IBOutlet weak var lblMainTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    let colors = Colors()
    let foodnames = ["Veggie burger","Teriyaki burger","Steamed cheeseburger","Steak burger",
                     "Slugburger","Slopper","Slider","Salmon burger",
                     "Rice burger","Patty melt","Pastrami burger","Naan burger",
                     "Luther Burger","Kimchi burger","Jucy Lucy","Hawaii burger",
                     "Hamdog","Hotdog Bun","Green chile burger","Curry burger",
                     "Chili burger","Cheeseburger","Carolina burger","California burger",
                     "Bøfsandwich","Butter burger","Buffalo burger","Barbecue burger",
                     "Bacon cheeseburger","Australasian hamburgers","Angus burger","Barbecue burger",
                     "Slugburger","Slopper","Slider","Salmon burger",
                     "Rice burger","Patty melt","Pastrami burger","Naan burger"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        creatGradientNavBar()
        
        self.lblMainTitle.text = "BURGERS OF NEW YORK"
        self.lblSubTitle.text = "Mellisa Main"
        
        self.mainCollectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func creatGradientNavBar() {
        self.vwNavView.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer!.frame = self.vwNavView.frame
        self.vwNavView.layer.insertSublayer(backgroundLayer!, at: 0)
    }
    
    @IBAction func onBackClick(_ sender: Any) {
//        self.navigationController?.popViewController(animated: true)
    }
    
}

//  UICollectionView DataSource
extension ViewController: UICollectionViewDataSource {
    // 1
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // 2
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.foodnames.count
    }
    
    // 3
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "food", for: indexPath) as! FoodPhotoCell
        let strImageName: String = String(format:"%d.jpg", indexPath.row+1)
        cell.imgFood.image = UIImage.init(named: strImageName)
        cell.lblFoodName.text = self.foodnames[indexPath.row]
        
        return cell
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: "banner",
                                                                             for: indexPath) as! TopBannerCell
            headerView.imgBanner.image = UIImage.init(named: "Title.jpg")
            headerView.lblBannerName.text = "BURGERS OF NEW YORK"
            headerView.lblBannerDesc.text = "Pizza-Love of my life"
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
}

//  UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    //  Cell Size with half the screen
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: collectionView.frame.size.width/2, height: collectionView.frame.size.width/2)
    }
    
    //  Banner View with 16:9
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let ratio = collectionView.frame.size.width / 16
        return CGSize.init(width: collectionView.frame.size.width, height: ratio * 9)
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
}

