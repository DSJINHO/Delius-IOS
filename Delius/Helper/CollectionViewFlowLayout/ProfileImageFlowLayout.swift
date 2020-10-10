//
//  ProfileImageFlowLayout.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 03/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit


class ProfileImageFlowLayout: UICollectionViewFlowLayout {
    
    private let cInterItemSpacing:CGFloat = 0
    private let cLineSpacing:CGFloat = 0
    
    private var itemAttributesCache: Array<UICollectionViewLayoutAttributes> = []
    private var suppleAttribute: Array<UICollectionViewLayoutAttributes> = []
    private var contentSize:CGSize = CGSize.zero
    var delegate:ProfileImageProtocolDelegate?
    
    override var collectionViewContentSize: CGSize {
        return contentSize
    }
    override init() {
        super.init()
        minimumLineSpacing = cLineSpacing
        minimumInteritemSpacing = cInterItemSpacing
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        minimumLineSpacing = cLineSpacing
        minimumInteritemSpacing = cInterItemSpacing
    }
    override func prepare() {
        super.prepare()
        if (collectionView?.numberOfSections == 0 ||
            collectionView?.numberOfItems(inSection: 0) == 0) {
            return
        }
        var iSize:CGSize = CGSize.zero
        var indexPath:NSIndexPath?
        let numberOfItems:NSInteger = (self.collectionView?.numberOfItems(inSection: 0))!
        itemAttributesCache = []
        for index in 0..<numberOfItems {
            indexPath = NSIndexPath(item: index, section: 0)
            iSize = (delegate?.collectionView(collectionView!, itemSizeAt: indexPath!))!
            var itemRect:CGRect = CGRect(x: 0, y: 0, width: iSize.width, height: iSize.height)
            if index == 0{
                itemRect.origin.x = 0
                itemRect.origin.y = 0
            }else if index == 1{
                itemRect.origin.x = (collectionView?.frame.width)!/2
                itemRect.origin.y = 0
            }else if index == 2{
                itemRect.origin.x = (collectionView?.frame.width)!/4*3
                itemRect.origin.y = 0
            }else if index == 3{
                itemRect.origin.x = (collectionView?.frame.width)!/2
                itemRect.origin.y = (collectionView?.frame.width)!/4
            }else{
                itemRect.origin.x = (collectionView?.frame.width)!/4*3
                itemRect.origin.y = (collectionView?.frame.width)!/4
            }
            let itemAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath! as IndexPath)
            itemAttributes.frame = itemRect
            itemAttributesCache.append(itemAttributes)
        }
        contentSize = CGSize(width: (collectionView?.frame.size.width)!, height: (collectionView?.frame.size.width)!/2)
    }
    
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let numberOfItems:NSInteger = (self.collectionView?.numberOfItems(inSection: 0))!
        let itemAttributes = itemAttributesCache.filter {
            $0.frame.intersects(rect) &&
                $0.indexPath.row < numberOfItems
        }
        return itemAttributes
    }
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return itemAttributesCache.first {
            $0.indexPath == indexPath
        }
    }
}
    
    
