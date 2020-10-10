//
//  Tab0Delegate.swift
//  Delius
//
//  Created by user on 2020/08/25.
//  Copyright © 2020 정윤환. All rights reserved.
//
protocol Tab0Delegate{
    func reloadMainList()
    func showTopView(show:Bool)
    func showAlertView(type:String,userData:MainListStruct)
    func continueSoloMatch()
    func removeSoloMatchView()
    func checkGroup(groupSize:Int,isLike:Bool)
}
