//
//  MatchFilterVC.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 19/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//
private enum pageState{
    case main,solo,group
}
import UIKit
class MatchFilterVC:UIViewController{
    
    var contentView:FilterView!
    var soloView:SoloFilterView!
    var groupView:GroupFilterView!
    
    var appSetting:UserSetStruct!
    
    private var nsLeftSolo:NSLayoutConstraint!
    private var nsLeftGroup:NSLayoutConstraint!
    private var currentStep:pageState = .main
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userSetting = UserDefaults.standard.object(forKey: "UserSetting") as? UserSetStruct{
            appSetting = userSetting
        }
        
        setup()
    }
    
    
    
    private func setup(){
        contentView = FilterView(frame: view.bounds)
        contentView.frame = view.bounds
        view.addSubview(contentView)
        let topPadding = UIApplication.shared.windows[0].safeAreaInsets.top
        let contentHeight = view.frame.height - 60 - topPadding
        soloView = SoloFilterView(frame: CGRect(x:0,y:0,width:view.frame.width,height:contentHeight))
        view.addSubview(soloView)
        soloView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        soloView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        nsLeftSolo = soloView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width)
        nsLeftSolo.isActive = true
        soloView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        groupView = GroupFilterView(frame:CGRect(x:0,y:0,width:view.frame.width,height:contentHeight))
        view.addSubview(groupView)
        groupView.topAnchor.constraint(equalTo: soloView.topAnchor).isActive = true
        groupView.bottomAnchor.constraint(equalTo: soloView.bottomAnchor).isActive = true
        groupView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        nsLeftGroup = groupView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width)
        nsLeftGroup.isActive = true
        
        
        contentView.backBtn.addTarget(self, action: #selector(backBtnFunc(_:)), for: .touchUpInside)
        contentView.soloBtnView.addTarget(self, action: #selector(soloViewFunc(_:)), for: .touchUpInside)
        contentView.groupBtnView.addTarget(self, action: #selector(groupViewFunc(_:)), for: .touchUpInside)
        
        
        
        soloView.info1CollectionView.dataSource = self
        soloView.info2CollectionView.dataSource = self
        soloView.info3CollectionView.dataSource = self
        soloView.info4CollectionView.dataSource = self
        soloView.info1CollectionView.delegate = self
        soloView.info2CollectionView.delegate = self
        soloView.info3CollectionView.delegate = self
        soloView.info4CollectionView.delegate = self
        soloView.info1CollectionView.register(FilterViewTagCell.self, forCellWithReuseIdentifier: "SoloFilterTagCell1")
        soloView.info2CollectionView.register(FilterViewTagCell.self, forCellWithReuseIdentifier: "SoloFilterTagCell2")
        soloView.info3CollectionView.register(FilterViewTagCell.self, forCellWithReuseIdentifier: "SoloFilterTagCell3")
        soloView.info4CollectionView.register(FilterViewTagCell.self, forCellWithReuseIdentifier: "SoloFilterTagCell4")
        
        groupView.info1CollectionView.dataSource = self
        groupView.info2CollectionView.dataSource = self
        groupView.info3CollectionView.dataSource = self
        groupView.info1CollectionView.delegate = self
        groupView.info2CollectionView.delegate = self
        groupView.info3CollectionView.delegate = self
        groupView.info1CollectionView.register(FilterViewTagCell.self, forCellWithReuseIdentifier: "GroupFilterTagCell1")
        groupView.info2CollectionView.register(FilterViewTagCell.self, forCellWithReuseIdentifier: "GroupFilterTagCell2")
        groupView.info3CollectionView.register(FilterViewTagCell.self, forCellWithReuseIdentifier: "GroupFilterTagCell3")
        
    }
    
    @objc func backBtnFunc(_ sender:UIButton){
        switch currentStep{
        case .main:
            dismiss(animated: true, completion: {})
        case .group:
            AnimationClose()
        case .solo:
            AnimationClose()
        }
    }
    @objc func soloViewFunc(_ sender:UIButton){
        AnimationOpen(to: .solo)
    }
    @objc func groupViewFunc(_ sender:UIButton){
        AnimationOpen(to: .group)
    }
    private func AnimationOpen(to:pageState){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            if to == .group{
                self.contentView.titleLabel1.alpha = 0
                self.contentView.titleLabel3.alpha = 1
                self.nsLeftGroup.constant = 0
                self.contentView.nsContent.constant = -100
                self.contentView.nsTitle1.constant = -120
                self.contentView.nsTitle3.constant = 0
            }else{
                self.contentView.titleLabel1.alpha = 0
                self.contentView.titleLabel2.alpha = 1
                self.nsLeftSolo.constant = 0
                self.contentView.nsContent.constant = -100
                self.contentView.nsTitle1.constant = -120
                self.contentView.nsTitle2.constant = 0
            }
            self.view.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                if to == .group{
                    self.currentStep = .group
                }else{
                    self.currentStep = .solo
                }
            }
        }
    }
    private func AnimationClose(){
        let Animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeIn, animations: {
            if self.currentStep == .group{
                self.contentView.titleLabel1.alpha = 1
                self.contentView.titleLabel3.alpha = 0
                self.nsLeftGroup.constant = self.view.frame.width
                self.contentView.nsContent.constant = 0
                self.contentView.nsTitle1.constant = 0
                self.contentView.nsTitle3.constant = 120
            }else{
                self.contentView.titleLabel1.alpha = 1
                self.contentView.titleLabel2.alpha = 0
                self.nsLeftSolo.constant = self.view.frame.width
                self.contentView.nsContent.constant = 0
                self.contentView.nsTitle1.constant = 0
                self.contentView.nsTitle2.constant = 120
            }
            self.view.layoutIfNeeded()
        })
        Animator.startAnimation()
        Animator.addCompletion{position in
            if position == .end{
                self.currentStep = .main
            }
        }
    }
}
extension MatchFilterVC:UICollectionViewDelegate{
    
}
extension MatchFilterVC:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case soloView.info1CollectionView:
            return String.SoloInfo1Array().count
        case soloView.info2CollectionView:
            return String.SoloInfo2Array().count
        case soloView.info3CollectionView:
            return String.SoloInfo3Array().count
        case soloView.info4CollectionView:
            return String.SoloInfo4Array().count
        case groupView.info1CollectionView:
            return String.GroupInfo1Array().count
        case groupView.info2CollectionView:
            return String.GroupInfo2Array().count
        case groupView.info3CollectionView:
            return String.GroupInfo3Array().count
        default:return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case soloView.info1CollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoloFilterTagCell1", for: indexPath) as! FilterViewTagCell
            cell.titleLabel.text = String.SoloInfo1Array()[indexPath.row]
            return cell
        case soloView.info2CollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoloFilterTagCell2", for: indexPath) as! FilterViewTagCell
            cell.titleLabel.text = String.SoloInfo2Array()[indexPath.row]
            return cell
        case soloView.info3CollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoloFilterTagCell3", for: indexPath) as! FilterViewTagCell
            cell.titleLabel.text = String.SoloInfo3Array()[indexPath.row]
            return cell
        case soloView.info4CollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoloFilterTagCell4", for: indexPath) as! FilterViewTagCell
            cell.titleLabel.text = String.SoloInfo4Array()[indexPath.row]
            return cell
        case groupView.info1CollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupFilterTagCell1", for: indexPath) as! FilterViewTagCell
            cell.titleLabel.text = String.GroupInfo1Array()[indexPath.row]
            return cell
        case groupView.info2CollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupFilterTagCell2", for: indexPath) as! FilterViewTagCell
            cell.titleLabel.text = String.GroupInfo2Array()[indexPath.row]
            return cell
        case groupView.info3CollectionView:
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupFilterTagCell3", for: indexPath) as! FilterViewTagCell
            cell.titleLabel.text = String.GroupInfo3Array()[indexPath.row]
            return cell
        default:
            let cell = UICollectionViewCell(frame: CGRect.zero)
            return cell
        }
    }
    
    
}
