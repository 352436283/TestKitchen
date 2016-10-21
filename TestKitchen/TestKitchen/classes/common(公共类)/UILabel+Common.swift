//
//  UILabel+Common.swift
//  TestKitchen
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 俞阳. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {

    class func createLabel(text:String?,textAligent:NSTextAlignment?,font:UIFont?)->UILabel{
        let label=UILabel()
        if let tmpText=text{
        
            label.text=tmpText
        }
        
        if let tmpAligent=textAligent{
        
            label.textAlignment=tmpAligent
        }
        
        if let tmpFont=font{
        
            label.font=tmpFont
        }
        
        return  label
        
    }
}
