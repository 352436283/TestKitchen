//
//  UIButton+Common.swift
//  TestKitchen
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 俞阳. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{

    class func createBtn(title:String?,bgImageName:String?,highImageName:String?,selectImageName:String?,target:AnyObject?,action:Selector)->UIButton{
        
        let btn=UIButton(type: .Custom)
        if let tmpTitle=title{
        
            btn.setTitle(tmpTitle, forState: .Normal)
            btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        }
        
        if let tmpBgImageName=bgImageName{
        
            
            btn.setBackgroundImage(UIImage(named: tmpBgImageName), forState: .Normal)
        }
        
        if let tmpHighBgImageName=highImageName{
        
            
            btn.setBackgroundImage(UIImage(named: tmpHighBgImageName), forState: .Highlighted)
        }
        
        if let tmpSelectName=selectImageName{
        
            btn.setBackgroundImage(UIImage(named: tmpSelectName), forState: .Selected)
        }
        
        if target != nil && action != nil {
        
            
            btn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        }
    
        
        return btn
    }
    
    
}
