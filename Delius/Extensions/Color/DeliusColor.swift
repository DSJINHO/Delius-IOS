//
//  DeliusColor.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 02/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//
import UIKit
extension UIColor{
    class func MainColor()->UIColor{
        return  UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        return UIColor(red: 255/255.0, green: 128/255.0, blue: 161/255.0, alpha: 1.0)
    }
    class func MainBlackColor1()->UIColor{
        return UIColor(red: 80/255.0, green: 80/255.0, blue: 80/255.0, alpha: 1)
    }
    class func MainBlackColor2()->UIColor{
        return UIColor(red: 100/255.0, green: 100/255.0, blue: 100/255.0, alpha: 1)
    }
    class func MainBlackColor3()->UIColor{
        return UIColor(red: 120/255.0, green: 120/255.0, blue: 120/255.0, alpha: 120/255.0)
    }
    class func MainBlackAlpha()->UIColor{
        return UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
    }
    class func MainAlphaView()->UIColor{
        return UIColor.gray.withAlphaComponent(0.3)
    }
    class func gradientColor() -> [UIColor]{
//        let color1 = UIColor(red: 255/255.0, green: 176/255.0, blue: 161/255.0, alpha: 1.0)
//        let color2 = UIColor(red: 255/255.0, green: 128/255.0, blue: 160/255.0, alpha: 1.0)
//        let color3 = UIColor(red: 248/255.0, green: 86/255.0, blue: 140/255.0, alpha: 1.0)
//        let color4 = UIColor(red: 96/255.0, green: 80/255.0, blue: 142/255.0, alpha: 1.0)
//        let color5 = UIColor(red: 83/255.0, green: 19/255.0, blue: 142/255.0, alpha: 1.0)
        let color1 = UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        let color2 = UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        let color3 = UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        let color4 = UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        let color5 = UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        return [color1,color2,color3,color4,color5]
    }
    class func welcomeGradientColor() -> [UIColor]{
        let color0 = UIColor.white
//        let color1 = UIColor(red: 255/255.0, green: 176/255.0, blue: 161/255.0, alpha: 1.0)
//        let color2 = UIColor(red: 255/255.0, green: 128/255.0, blue: 160/255.0, alpha: 1.0)
//        let color3 = UIColor(red: 248/255.0, green: 86/255.0, blue: 140/255.0, alpha: 1.0)
//        let color4 = UIColor(red: 96/255.0, green: 80/255.0, blue: 142/255.0, alpha: 1.0)
//        let color5 = UIColor(red: 83/255.0, green: 19/255.0, blue: 142/255.0, alpha: 1.0)
//        let color6 = UIColor.white
        let color1 = UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        let color2 = UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        let color3 = UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        let color4 = UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        let color5 = UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        let color6 = UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        return [color0,color1,color2,color3,color4,color5,color6]
    }
///사용컬러
    ///검정
    class func MainBlackColor()->UIColor{
        return UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
    }
    ///회색
    class func MainGrayColor()->UIColor{
        return UIColor(red: 127/255.0, green: 127/255.0, blue: 127/255.0, alpha: 1.0)
    }
    ///연한회색
    class func MainLightGrayColor()->UIColor{
        return UIColor(red: 216/255.0, green: 216/255.0, blue: 216/255.0, alpha: 1.0)
    }
    ///가장연한회색
    class func MainLightGrayColor2()->UIColor{
        return UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1.0)
    }
    
    ///비밀번호가 틀립니다 등의 문구
    class func MainSubTextColor()->UIColor{
        return UIColor(red: 255/255.0, green: 128/255.0, blue: 161/255.0, alpha: 1.0)
    }
    ///파란색 그룹 달력
    class func GroupTextColor()->UIColor{
        return UIColor(red: 135/255.0, green: 185/255.0, blue: 221/255.0, alpha: 1.0)
    }
    ///백색
    class func MainWhiteColor()->UIColor{
        return UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
    }
    ///노랑
    class func MainYellowColor()->UIColor{
        return UIColor(red: 251/255.0, green: 192/255.0, blue: 45/255.0, alpha: 1.0)
    }
    
    
///전체 그라데이션 컬러
    class func allGradientColor() -> [UIColor]{
//        let color0 = UIColor(red: 173/255.0, green: 141/255.0, blue: 245/255.0, alpha: 1.0)
//        let color1 = UIColor(red: 255/255.0, green: 128/255.0, blue: 160/255.0, alpha: 1.0)
        let color0 = UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        let color1 = UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        return [color0,color1]
    }
    
///그룹 그라데이션 컬러
    class func groupGradientColor() -> [UIColor]{
        let color0 = UIColor(red: 133/255.0, green: 211/255.0, blue: 245/255.0, alpha: 1.0)
        let color1 = UIColor(red: 255/255.0, green: 128/255.0, blue: 160/255.0, alpha: 1.0)
        return [color0,color1]
    }
    
    
    
    
    
    class func yellowType1() -> UIColor{
        return UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        return UIColor(red: 255/255.0, green: 200/255.0, blue: 35/255.0, alpha: 1.0)
    }
    class func yellowType2() -> UIColor{ //more dense
    return UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        return UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
    }
    class func purpleType1()-> UIColor{
        return UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        return UIColor(red: 159/255.0, green: 140/255.0, blue: 232/255.0, alpha: 1.0)
    }
    class func purpleType2()-> UIColor{ // more dense
    return UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        return UIColor(red: 114/255.0, green: 112/255.0, blue: 183/255.0, alpha: 1.0)
    }
    class func pinkType1() -> UIColor{
        return UIColor(red: 255/255.0, green: 188/255.0, blue: 84/255.0, alpha: 1.0)
        return UIColor(red: 255/255.0, green: 128/255.0, blue: 161/255.0, alpha: 1.0)
    }
    class func pinkType2() -> UIColor{
        return UIColor(red: 255/255.0, green: 128/255.0, blue: 161/255.0, alpha: 0.5)
    }
    class func blackType1()->UIColor{
        
        return UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
    }
    class func blackType2()->UIColor{
        
        return UIColor(red: 40/255.0, green: 40/255.0, blue: 40/255.0, alpha: 1)
    }
    class func blackType3()->UIColor{
        
        return UIColor(red: 80/255.0, green: 80/255.0, blue: 80/255.0, alpha: 1)
    }
    class func grayType1()->UIColor{
        
        return UIColor(red: 127/255.0, green: 127/255.0, blue: 127/255.0, alpha: 1.0)
    }
    class func grayType2()->UIColor{
        
        return UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1.0)
    }
    class func grayType3()->UIColor{
        
        return UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
    }
}
