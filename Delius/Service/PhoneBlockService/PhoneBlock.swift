//
//  PhoneBlock.swift
//  Delius
//
//  Created by user on 2020/08/05.
//  Copyright © 2020 정윤환. All rights reserved.
//
import FirebaseFirestore
class PhoneBlock{
    var blockListener:ListenerRegistration!
    var blockedUsers=[PhoneBlockDictionary]()
    
    var db : Firestore!
}
