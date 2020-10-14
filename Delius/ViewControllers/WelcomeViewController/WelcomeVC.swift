//
//  WelcomeVC.swift
//  delius-signin
//
//  Created by user on 2020/09/10.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import AVFoundation
import Firebase
import FirebaseStorage
class WelcomeVC:UIViewController {
    var contentView:WelcomeView!
    let storage = Storage.storage()
    var avPlayer:AVPlayer!
    var avPlayerLayer:AVPlayerLayer!
    var paused:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
               let theURL = URL(string: "https://storage.googleapis.com/delius-thumnail/deliVideo.mp4")
               avPlayer = AVPlayer(url: theURL!)
               avPlayerLayer = AVPlayerLayer(player: avPlayer)
               avPlayerLayer.videoGravity = .resizeAspectFill
               avPlayer.volume = 0
               avPlayer.actionAtItemEnd = .none

               avPlayerLayer.frame = view.layer.bounds
               view.backgroundColor = .clear
               view.layer.insertSublayer(avPlayerLayer, at: 0)

               NotificationCenter.default.addObserver(self,
                                                  selector: #selector(playerItemDidReachEnd(notification:)),
                                                  name: .AVPlayerItemDidPlayToEndTime,
                                                  object: avPlayer.currentItem)
        
        setView()
    }
    private func setView(){
        contentView = WelcomeView(frame: view.bounds)
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.emailStart.addTarget(self, action: #selector(emailStratFunc(_:)), for: .touchUpInside)
        contentView.phoneStart.addTarget(self, action: #selector(phoneStartFunc(_:)), for: .touchUpInside)
    }
    @objc func emailStratFunc(_ sender:UIButton){
        let vc = LoginVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: {})
    }
    @objc func phoneStartFunc(_ sender:UIButton){
        let vc = TermVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: {})
    }
    @objc func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: .zero)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        avPlayer.play()
        paused = false
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        avPlayer.pause()
        paused = true
    }
}
