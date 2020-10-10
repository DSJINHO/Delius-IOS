//
//  CalculateViewHeight.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 18/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit
final class CalculateViewHeight{
    class func CalculateTab0TagHeight(TagArrayList arr:[String],ViewWidth vw:CGFloat)->CGFloat{
        let width:CGFloat = vw - 40
        let lineHeight:CGFloat = 30
        let term:CGFloat = 5
        let itemTerm:CGFloat = 15
        let spacing:CGFloat = 38
        var numberOfLines:CGFloat = 0
        var x:CGFloat = 0
        for i in arr{
            let size = i.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
            if x == 0{
                if size.width > width{
                    numberOfLines += 1
                    x = 0
                }else{
                    x += size.width + spacing
                }
            }else{
                if size.width + spacing + x + itemTerm > width {
                    numberOfLines += 1
                    x = size.width + spacing
                }else{
                    x += size.width + spacing
                }
            }
        }
        let result = numberOfLines * lineHeight + term * (numberOfLines - 1)
        return result
    }
    class func Tab0CellSoloHeight(TagArray:[String],ViewWidth:CGFloat,status:String)->CGSize{
        
        let collectionViewHeight = CalculateViewHeight.CalculateTab0TagHeight(TagArrayList: TagArray, ViewWidth: ViewWidth)
        let fixHeight:CGFloat = 200 + ViewWidth/2
        let statusHeight = status.StringHeight(withConstrainedWidth: ViewWidth - 60, font: UIFont.DeliusBoldType1())
        
        let cellHeight = collectionViewHeight + fixHeight + statusHeight
        
        return CGSize(width: ViewWidth, height: cellHeight)
    }
    class func Tab0CellGroup2Height(TagArray:[String],ViewWidth:CGFloat,status:String)->CGSize{
        
        let collectionViewHeight = CalculateViewHeight.CalculateTab0TagHeight(TagArrayList: TagArray, ViewWidth: ViewWidth)
        let fixHeight:CGFloat = 360
        let statusHeight = status.StringHeight(withConstrainedWidth: ViewWidth - 60, font: UIFont.DeliusBoldType1())
        
        let cellHeight = collectionViewHeight + fixHeight + statusHeight
        
        return CGSize(width: ViewWidth, height: cellHeight)
    }
    class func Tab0CellGroup3Height(TagArray:[String],ViewWidth:CGFloat,status:String)->CGSize{
        
        let collectionViewHeight = CalculateViewHeight.CalculateTab0TagHeight(TagArrayList: TagArray, ViewWidth: ViewWidth)
        let fixHeight:CGFloat = 460
        let statusHeight = status.StringHeight(withConstrainedWidth: ViewWidth - 60, font: UIFont.DeliusBoldType1())
        
        let cellHeight = collectionViewHeight + fixHeight + statusHeight
        
        return CGSize(width: ViewWidth, height: cellHeight)
    }
    class func Tab0CellGroup4Height(TagArray:[String],ViewWidth:CGFloat,status:String)->CGSize{
        
        let collectionViewHeight = CalculateViewHeight.CalculateTab0TagHeight(TagArrayList: TagArray, ViewWidth: ViewWidth)
        let fixHeight:CGFloat = 560
        let statusHeight = status.StringHeight(withConstrainedWidth: ViewWidth - 60, font: UIFont.DeliusBoldType1())
        
        let cellHeight = collectionViewHeight + fixHeight + statusHeight
        
        return CGSize(width: ViewWidth, height: cellHeight)
    }
}
