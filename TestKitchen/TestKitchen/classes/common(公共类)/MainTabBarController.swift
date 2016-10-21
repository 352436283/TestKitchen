//
//  MainTabBarController.swift
//  TestKitchen
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 俞阳. All rights reserved.
//

import UIKit
import SnapKit


class MainTabBarController: UITabBarController {
    private var bgView:UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        createViewcontrollers()
        //自定制tabbar
        //隐藏系统的tabbar
        tabBar.hidden=true
        createMyTabBar()
    }
    
    
    //自定制tabbar
    func createMyTabBar(){
        
        //创建背景视图
        bgView=UIView.createView()
        view.addSubview(bgView!)
        bgView?.backgroundColor=UIColor(white: 0.9, alpha: 1.0)
        //设置边框
//        bgView?.layer.borderColor=UIColor.blackColor().CGColor
//        bgView?.layer.borderWidth=1
        
        bgView?.snp_makeConstraints(closure: {
        
            [weak self] (make) in
            make.left.right.bottom.equalTo((self?.view)!)
            make.height.equalTo(49)
        })
        
        //图片的名字
        let imageNames=["home","community","shop","shike","mine"]
        //标题文字
        let titles=["食材","社区","商城","食课","我的"]
    
        
        //循环创建按钮
        let width=sw/CGFloat(imageNames.count)
        for i in 0..<imageNames.count{
        
            let imageName=imageNames[i]+"_normal"
            let selectName=imageNames[i]+"_select"
            let btn=UIButton.createBtn(nil, bgImageName: imageName, highImageName: nil, selectImageName: selectName, target: self, action: #selector(clickBtn(_:)))
            btn.tag=300+i
            bgView?.addSubview(btn)
            //设置位置
            btn.snp_makeConstraints(closure: {
            
                [weak self] (make) in
                make.top.equalTo(self!.bgView!)
                make.width.equalTo(width)
                make.left.equalTo(width*CGFloat(i))
            })
            
            //显示标题
            let titleLabel=UILabel.createLabel(titles[i], textAligent: .Center, font: UIFont.systemFontOfSize(10))
            btn.addSubview(titleLabel)
            
            titleLabel.snp_makeConstraints(closure: {
            [weak self] (make) in
                make.left.right.bottom.equalTo(btn)
                make.height.equalTo(20)
            })
            
        }
        
    }
    
    func clickBtn(curBtn:UIButton){
        let index=curBtn.tag-300
        if selectedIndex != index{
        //1.1取消选中之前的按钮 
        let lastBtn=bgView?.viewWithTag(300+selectedIndex) as! UIButton
        lastBtn.selected=false
            lastBtn.userInteractionEnabled=true
        
        //1.2选中当前的按钮
        curBtn.selected=true
            curBtn.userInteractionEnabled=false
        
        //1.3切换制图控制器
        selectedIndex=index
        }
    
        
    }

    
    //创建视图控制器
    func createViewcontrollers(){
    
        let nameArray=["TestKitchen.IngredientViewController","TestKitchen.CommunityViewController","TestKitchen.MallViewController","TestKitchen.FoodClassViewController","TestKitchen.ProfileViewController"]
        //图片的名字
        let imageNames=["home","community","shop","shike","mine"]
        //标题文字
        let titles=["食材","社区","商城","食课","我的"]
        
        // 视图控制器对象的数组
        var ctrlArray:[UINavigationController]=[]
        for i in 0..<nameArray.count{
        
            //使用类名创建类的对象
            let ctrl=NSClassFromString(nameArray[i]) as! UIViewController.Type
            let vc=ctrl.init()
            
            //设置图片和文字
            vc.tabBarItem.title=titles[i]
            let imageName=imageNames[i]+"_normal"
            vc.tabBarItem.image=UIImage(named: imageName)
            
            let selectName=imageNames[i]+"_select"
            vc.tabBarItem.selectedImage=UIImage(named: selectName)
            
            //导航
            let navCtrl=UINavigationController(rootViewController: vc)
            ctrlArray.append(navCtrl)
        }
        //tabBarController?.viewControllers=ctrlArray
        //此处直接省略self.
        viewControllers=ctrlArray
        
        
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
