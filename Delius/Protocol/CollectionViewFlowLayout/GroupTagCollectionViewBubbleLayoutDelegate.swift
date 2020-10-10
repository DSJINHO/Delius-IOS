//
//  GroupTagCollectionViewBubbleLayoutDelegate.swift
//  Delius
//
//  Created by 박진호 on 2020/06/14.
//  Copyright © 2020 정윤환. All rights reserved.
//


import UIKit

protocol GroupTagCollectionViewBubbleLayoutDelegate {
    func collectionView(_ collectionView:UICollectionView, itemSizeAt indexPath:NSIndexPath) -> CGSize
}
