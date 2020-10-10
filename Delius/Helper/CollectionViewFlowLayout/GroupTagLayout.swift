//
//  GroupTagLayout.swift
//  Delius
//
//  Created by 박진호 on 2020/06/14.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit


class groupTagLayout: UICollectionViewFlowLayout {
    
    private let cInterItemSpacing:CGFloat = 30
    private let cLineSpacing:CGFloat = 20
    
    private var itemAttributesCache: Array<UICollectionViewLayoutAttributes> = []
    private var suppleAttribute: Array<UICollectionViewLayoutAttributes> = []
    private var contentSize:CGSize = CGSize.zero
    var delegate:GroupTagCollectionViewBubbleLayoutDelegate?
    
    
    override var collectionViewContentSize: CGSize {
        
        return contentSize
    }
    
    // MARK:-
    // MARK:- Initialize
    
    override init() {
        super.init()
        
        scrollDirection = UICollectionView.ScrollDirection.vertical;
        minimumLineSpacing = cLineSpacing
        minimumInteritemSpacing = cInterItemSpacing
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        scrollDirection = UICollectionView.ScrollDirection.vertical;
        minimumLineSpacing = cLineSpacing
        minimumInteritemSpacing = cInterItemSpacing
    }
    
    
    // MARK:-
    // MARK:- Override
    
    override func prepare() {
        super.prepare()
        
        if (collectionView?.numberOfSections == 0 ||
            collectionView?.numberOfItems(inSection: 0) == 0) {
            return
        }
        var x:CGFloat = 0
        var y:CGFloat = 0
        var lastY:CGFloat = 0
        let section = collectionView?.numberOfSections
        itemAttributesCache = []
        for i in 0..<section!{
            
            let indexPath2 = NSIndexPath(row: 0, section: i)
            let suppleCache = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, with: indexPath2 as IndexPath)

            suppleCache.frame = CGRect(x: 0.0, y: y, width: 100, height: 50)
            suppleCache.zIndex = Int.max - 3

            suppleAttribute.append(suppleCache)
            
            var iSize:CGSize = CGSize.zero

            var indexPath:NSIndexPath?
            let numberOfItems:NSInteger = (self.collectionView?.numberOfItems(inSection: i))!
            
            y += 50
            for index in 0..<numberOfItems {
                indexPath = NSIndexPath(item: index, section: i)
                iSize = (delegate?.collectionView(collectionView!, itemSizeAt: indexPath!))!
                
                var itemRect:CGRect = CGRect(x: x, y: y, width: iSize.width, height: iSize.height)
                if (x > 0 && (x + iSize.width + minimumInteritemSpacing > (collectionView?.frame.size.width)!)) {
                    //...Checking if item width is greater than collection view width then set item in new row.
                    itemRect.origin.x = 0
                    itemRect.origin.y = y + iSize.height + minimumLineSpacing
                }
                
                let itemAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath! as IndexPath)
                itemAttributes.frame = itemRect
                itemAttributesCache.append(itemAttributes)
                
                x = itemRect.origin.x + iSize.width + minimumInteritemSpacing
                y = itemRect.origin.y
            }
            
            y += iSize.height + self.minimumLineSpacing
            x = 0
            
            lastY += y
            
        }
        contentSize = CGSize(width: (collectionView?.frame.size.width)!, height: y)
        
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var itemAttributes = itemAttributesCache.filter {
            $0.frame.intersects(rect)
        }
        let suppleAttributes2 = suppleAttribute
        itemAttributes.append(contentsOf: suppleAttributes2)
        return itemAttributes
    }
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        var layoutAttributes = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: elementKind, with: indexPath)
        
        if elementKind == UICollectionView.elementKindSectionHeader {
            if indexPath.section == 0{
                layoutAttributes = suppleAttribute[0]
            }else if indexPath.section == 1{
                layoutAttributes = suppleAttribute[1]
            }else{
                layoutAttributes = suppleAttribute[2]
                
            }
        }

        return layoutAttributes
    }
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return itemAttributesCache.first {
            $0.indexPath == indexPath
        }
    }
}
