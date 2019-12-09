//
//  CardListVC.swift
//  CardMaker
//
//  Created by Tushar Sharma on 06/12/19.
//  Copyright © 2019 Appecules. All rights reserved.
//

import UIKit

class CardListVC: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  
    

    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    let cardImages = ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18"]
    override func viewDidLoad() {
        super.viewDidLoad()

        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        cardCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell"); //register custom UICollectionViewCell class.
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
               cell.backgroundColor = .blue;
        
        let imageview:UIImageView=UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height));
        imageview.contentMode = .scaleAspectFill
        let imageName: String = cardImages[indexPath.row]
        let img : UIImage = UIImage(named:imageName)!
        imageview.image = img
        
        cell.contentView.addSubview(imageview)
        return cell;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  30
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        CardOperationVC.selectedImage = cardImages[indexPath.row]
        navigate(newControl: "CardDetailVC", StoryBoard: "Main")
    }
}
extension UIViewController {
    func navigate(newControl: String, StoryBoard:String){
        let viewControllerNameIs : String = newControl
        let storyBoard : UIStoryboard = UIStoryboard(name: StoryBoard, bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: viewControllerNameIs)
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }

}


