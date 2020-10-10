//
//  SideTopCellLayout.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 2020/06/03.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit
class SideTopCellLayout: UICollectionViewFlowLayout {
    
    private let cInterItemSpacing:CGFloat = 15
    private let cLineSpacing:CGFloat = 5
    
    private var itemAttributesCache: Array<UICollectionViewLayoutAttributes> = []
    private var contentSize:CGSize = CGSize.zero
    var delegate:SideTopCellProtocolDelegate?
    
    override var collectionViewContentSize: CGSize {
        return contentSize
    }
    
    
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
    
    
    
    override func prepare() {
        super.prepare()
        
        if (collectionView?.numberOfSections == 0 ||
            collectionView?.numberOfItems(inSection: 0) == 0) {
            return
        }
        
        var x:CGFloat = 0
        var y:CGFloat = 0
        var iSize:CGSize = CGSize.zero
        
        var indexPath:NSIndexPath?
        let numberOfItems:NSInteger = (self.collectionView?.numberOfItems(inSection: 0))!
        
        
        itemAttributesCache = []
        
        for index in 0..<numberOfItems {
            indexPath = NSIndexPath(item: index, section: 0)
            iSize = (delegate?.collectionView(collectionView!, itemSizeAt: indexPath!))!
            
            var itemRect:CGRect = CGRect(x: x, y: y, width: iSize.width, height: iSize.height)
            if (x > 0 && (x + iSize.width + minimumInteritemSpacing > (collectionView?.frame.size.width)!)) {
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
        collectionView?.bottomAnchor.constraint(equalTo: collectionView!.topAnchor, constant: y).isActive = true
        contentSize = CGSize(width: (collectionView?.frame.size.width)!, height: y)
        
        
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
