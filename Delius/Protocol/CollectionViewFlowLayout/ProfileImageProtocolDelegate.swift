//
//  ProfileImageProtocolDelegate.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 08/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//

import UIKit

protocol ProfileImageProtocolDelegate {
    func collectionView(_ collectionView:UICollectionView, itemSizeAt indexPath:NSIndexPath) -> CGSize
}
