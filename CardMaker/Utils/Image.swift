//
//  Image.swift
//  CardMaker
//
//  Created by Tushar Sharma on 08/12/19.
//  Copyright © 2019 Appecules. All rights reserved.
//

import Foundation
import UIKit
extension UIImage {
    
    convenience init?(view: UIView?) {
        guard let view: UIView = view else { return nil }
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)
        guard let context: CGContext = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        view.layer.render(in: context)
        let contextImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard
            let image: UIImage = contextImage,
            let pngData: Data = image.pngData()
            else { return nil }
        
        self.init(data: pngData)
    }
    
}
