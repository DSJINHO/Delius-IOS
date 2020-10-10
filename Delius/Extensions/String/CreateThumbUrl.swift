//
//  CreateThumbUrl.swift
//  Delius
//
//  Created by 박진호 on 2020/07/01.
//  Copyright © 2020 정윤환. All rights reserved.
//
import UIKit
import SDWebImage
class CreateThumbUrl{
    class func mainImgUrl(uid:String,imgObjs:[imgStruct])->URL{
        var profileImgName = ""
        var bucket = ""
        var profileTp:Int = 0
        for obj in imgObjs{
            let isMain = obj.isMain!
            let tp = obj.tp!
            let imgName = obj.imgNa!
            let bucketName = obj.bucket!
            if isMain == "true" {
                if tp > profileTp {
                    profileTp = tp
                    profileImgName = imgName
                    bucket = bucketName
                }
            }
            
        }
        let str = "https://storage.googleapis.com/\(bucket)/profile/\(uid)/\(profileImgName)"
        let url = URL(string: str)
        return url!
    }
    class func allImgUrls(uid:String,imgObjs:[imgStruct])->[URL]{
        var profileImgName = ""
        var bucket = ""
        var profileTp:Int = 0
        for obj in imgObjs{
            let isMain = obj.isMain!
            let tp = obj.tp!
            let imgName = obj.imgNa!
            let bucketName = obj.bucket!
            if isMain == "true" {
                if tp > profileTp {
                    profileTp = tp
                    profileImgName = imgName
                    bucket = bucketName
                }
            }
        }
        var urls = [URL]()
        for im in imgObjs{
            let str = "https://storage.googleapis.com/\(im.bucket!)/profile/\(uid)/\(im.imgNa!)"
            let url = URL(string: str)
            print("@url@",url)
            urls.append(url!)
        }
        print(urls,"$^$^")
        return urls
    }
    class func classifyUserImageNames(imgObjs:[imgStruct])->[String]{
        var profileImgName = ""
        var bucket = ""
        var profileTp:Int = 0
        for obj in imgObjs{
            guard let isMain = obj.isMain else { return [profileImgName,bucket] }
            guard let tp = obj.tp else { return [profileImgName,bucket] }
            guard let imgName = obj.imgNa else { return [profileImgName,bucket] }
            guard let bucketName = obj.bucket else { return [profileImgName,bucket] }
            
            if isMain == "true" {
                if tp > profileTp {
                    profileTp = tp
                    profileImgName = imgName
                    bucket = bucketName
                }
            }
            print(profileImgName,"{}{}{}{}")
            
        }
        return  [profileImgName,bucket]
    }
    class func allImages(imgObjs:[imgStruct])->[[String]]{
        var imgNames = [String]()
        var profileTp:Int = 0
        var buckets = [String]()
        for obj in imgObjs{
            guard let isMain = obj.isMain else { return [imgNames,buckets] }
            guard let tp = obj.tp else { return [imgNames,buckets] }
            guard let imgName = obj.imgNa else { return [imgNames,buckets] }
            guard let bucket = obj.bucket else { return [imgNames,buckets] }
            
            if isMain == "true" {
                if tp > profileTp {
                    profileTp = tp
                    imgNames.insert(imgName, at: 0)
                    buckets.insert(bucket, at: 0)
                }else{
                    imgNames.append(imgName)
                    buckets.append(bucket)
                }
            }else{
                imgNames.append(imgName)
                buckets.append(bucket)
            }
        }
        return [imgNames,buckets]
    }
    class func url(imageView iv:UIImageView,uid:String,imgName:String){
        let str = "https://storage.googleapis.com/delius-thumnail/profile/\(uid)/\(imgName)"
        if let url = URL(string: str){
            iv.sd_setImage(with: url, completed: {(img,err,cache,url) in
                if err != nil{
                    iv.image = nil
                    return
                }
                iv.image = img
            })
        }else{
            iv.image = nil
        }
    }
    class func createURL(bucket:String,uid:String,imgName:String)->URL{
        let str = "https://storage.googleapis.com/\(bucket)/profile/\(uid)/\(imgName)"
        if let url = URL(string:str){
            return url
        }else{
            return URL(string: "")!
        }
    }
    class func fillImage(imageView iv:UIImageView,uid:String,imgName:String){
    }
    class func fillImageWithCompletion(imageView iv:UIImageView,uid:String,imgName:String,bucket:String,completion:@escaping()->Void){
        let str = "https://storage.googleapis.com/\(bucket)/profile/\(uid)/\(imgName)"
        if let url = URL(string: str){
            iv.sd_setImage(with: url, completed: {(img,err,cache,url) in
                if err != nil{
                    iv.image = nil
                    completion()
                    return
                }
                iv.image = img
                completion()
            })
        }else{
            iv.image = nil
            completion()
        }
    }
    class func createImageArray(uid:String,imArr:[[String:Any]],completion:@escaping([UIImage])->Void){
        var returnArray = [UIImage]()
        let async = DispatchGroup()
        for i in imArr{
            async.enter()
            if let name = i["imgNa"] as? String{
                self.downloadImage(uid: uid, imgName: name, completion: { (image) in
                    returnArray.append(image)
                    async.leave()
                })
            }
        }
        async.notify(queue: .main, execute: {
            completion(returnArray)
        })
        
    }
    
    class func downloadImage(uid:String,imgName:String,completion:@escaping(UIImage)->Void){
        let str = "https://storage.googleapis.com/delius-thumnail/profile/\(uid)/\(imgName)"
        
        var returnImg=UIImage(named: "c")!
        guard let url = URL(string:str) else {
            completion(returnImg)
            return
        }
        UIImageView().sd_setImage(with: url, completed: {(img,err,cache,url) in
            if err != nil{
                completion(returnImg)
                return
            }
            returnImg = img!
            completion(returnImg)
        })
    }
}
