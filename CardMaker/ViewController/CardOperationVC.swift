//
//  CardOperationVC.swift
//  CardMaker
//
//  Created by Tushar Sharma on 06/12/19.
//  Copyright © 2019 Appecules. All rights reserved.
//

import UIKit

class CardOperationVC: UIViewController {

    
    @IBOutlet weak var saveImage: UIButton!
    @IBOutlet weak var cardImageView: UIImageView!
    static var selectedImage: String = "01"
    static var selectedMessage: String = "Merry Christmas"
    static var selectedName: String = "Tushar Sharma"
    
    var messageLabel = UILabel()
    var nameLabel = UILabel()
    
    @IBOutlet weak var contentTable: UITableView!
    
    var cardThumbs = ["01T","02T","03T","04T","05T","06T","07T","08T","09T","10T","11T","12T","13T","14T","15T","16T","17T","18T"]
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTable.delegate = self
        contentTable.dataSource = self
        contentTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        initialisedLabel()
        initialiseMessageLabel()
        cardImageView.image = UIImage(named: CardOperationVC.selectedImage)
        // Do any additional setup after loading the view.
    }
    
    func initialisedLabel() {
        nameLabel = UILabel(frame: CGRect(x:self.view.bounds.width / 2 - 50, y:self.view.bounds.height / 2 - 50, width: 100, height: 100))
        nameLabel.backgroundColor = .clear
        nameLabel.text = CardOperationVC.selectedName
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        self.view.addSubview(nameLabel)
        
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(CardOperationVC.wasDragged(_:)))
       
      
        nameLabel.addGestureRecognizer(gesture)
        nameLabel.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }
    
    func initialiseMessageLabel() {
       messageLabel = UILabel(frame: CGRect(x:self.view.bounds.width / 2 - 50, y:self.view.bounds.height / 2 - 50, width: self.view.frame.width/2, height: self.view.frame.height/2))
        messageLabel.text = CardOperationVC.selectedMessage
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        self.view.addSubview(messageLabel)
        
         let gesture = UIPanGestureRecognizer(target: self, action: #selector(CardOperationVC.wasDragged(_:)))
        messageLabel.addGestureRecognizer(gesture)
        messageLabel.isUserInteractionEnabled = true
    }
    @objc func wasDragged(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)
        let label = gesture.view!
        label.center = CGPoint(x: label.center.x + translation.x, y: label.center.y + translation.y)
        gesture.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @IBAction func saveImageBtnAction(_ sender: Any) {
        captureScreen()
    }
    
    @IBAction func changeFontAction(_ sender: Any) {
        self.messageLabel.font = fontFamily.Copperplate.size(20.0)
    }
    
    @IBAction func changeColorAction(_ sender: Any) {
        
        contentTable.reloadData()
        contentTable.isHidden = false
    }
    @IBAction func changeImageAction(_ sender: Any) {
        contentTable.reloadData()
        contentTable.isHidden = false
    }
    
    func captureScreen() {
         let myImage: UIImage? = UIImage(view: self.view)
        UIImageWriteToSavedPhotosAlbum(myImage!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your Card has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }

    
    func constructBackground(image: String) {
        
        
    }
}

private let familyName = "Copperplate"
enum fontFamily: String {
    case Copperplate = "Copperplate"
    case Heiti = "Heiti SC"
    case Thonburi = "Thonburi"
    case Gill = "Gill Sans"
    case Marker = "Marker Felt"
    case Hiragino = "Hiragino Maru Gothic ProN"
    case CourierNEW = "Courier New"
    case HeitiTC = "Heiti TC"
    case AvenirNEXT = "Avenir Next Condensed"
    case Helvetica = "Helvetica Neue"
    case Kohinoor = "Kohinoor Devanagari"
    
    func size(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: fullFontName, size: size + 1.0) {
            return font
        }
        fatalError("Font '\(fullFontName)' does not exist.")
    }
    
    fileprivate var fullFontName: String {
        return rawValue.isEmpty ? familyName : rawValue
    }
    
}
extension CardOperationVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardThumbs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let imageview:UIImageView=UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
        cell.backgroundColor = .clear
        imageview.contentMode = .scaleAspectFit
        let imageName: String = cardThumbs[indexPath.row]
        let img : UIImage = UIImage(named:imageName)!
        imageview.image = img
        
        cell.contentView.addSubview(imageview)
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var imageName: String = cardThumbs[indexPath.row]
        imageName.removeLast()
        cardImageView.image = UIImage(named: imageName)
        
    }
}
