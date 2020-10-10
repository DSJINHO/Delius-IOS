//
//  AddingGroupDateVC.swift
//  Delius
//
//  Created by 박진호 on 2020/06/14.
//  Copyright © 2020 정윤환. All rights reserved.
//
protocol ProtocolAddingGroupDate{
    func completeDate(obj:[String:Any])
}
import UIKit
class AddingGroupDateVC:UIViewController{
    var contentView:AddingGroupDateView!
    var delegate:ProtocolAddingGroupDate?=nil
    lazy var calendar: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.headerReferenceSize = CGSize(width: 110, height: 34)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var selectedIndex: IndexPath? = nil
    var selectedDate = Date()
    var todayIndex:IndexPath? = nil
    var todayDate = Date()
    
    var ltp:Double!
    var ltpString:String?
    
    var verticalConstraint: NSLayoutConstraint? = nil
    var heightConstraint: NSLayoutConstraint? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        setup()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(false)
        self.dismiss(animated: false, completion: {})
    }
    private func setup(){
        
        let numberOfCellsPerRow: CGFloat = 7
        
        calendar.register(calendarCell.self, forCellWithReuseIdentifier: "calendarCellid")
        calendar.register(calendarHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "calendarHeaderid")
        
        
        if let flowLayout = calendar.collectionViewLayout as? UICollectionViewFlowLayout {
            let horizontalSpacing = flowLayout.scrollDirection == .vertical ? flowLayout.minimumInteritemSpacing : flowLayout.minimumLineSpacing
            let cellWidth = (view.frame.width - 16 - max(0, numberOfCellsPerRow - 1)*horizontalSpacing)/numberOfCellsPerRow
            print(view.frame.width-16)
            print(flowLayout.itemSize)
            print(cellWidth)
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
            print("#######")
        }
        contentView = AddingGroupDateView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.completeBtn.addTarget(self, action: #selector(completeBtnFunc(_:)), for: .touchUpInside)
        
        
        contentView.addSubview(calendar)
        calendar.topAnchor.constraint(equalTo: contentView.endDateLabel.bottomAnchor, constant: 30).isActive = true
        calendar.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30).isActive = true
        calendar.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30).isActive = true
        calendar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    private func checkData(completion:@escaping(Double,String)->Void){
        if self.ltp == nil || self.ltpString == nil{
            ShowAlert.OnlyDefault(vc: self, title: "", message: "선택하세요")
            return
        }
        completion(ltp!,ltpString!)
        
    }
    @objc func completeBtnFunc(_ sender:UIButton){
        checkData { (value,string) in
            self.delegate?.completeDate(obj: ["ltp":value,"string":string])
        }
    }
}

extension AddingGroupDateVC:UICollectionViewDelegate{
    
}
extension AddingGroupDateVC:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calendarCellid", for: indexPath) as! calendarCell
        let calendarDay = cell.label
        calendarDay.textColor = UIColor.lightGray
        calendarDay.font = UIFont.systemFont(ofSize: 16)
        if indexPath.row+1 >= Date().addMonthFC(month: indexPath.section).startOfMonthFC().getDayOfWeekFC()!+7{
            calendarDay.text = "\((indexPath.row+1)-(Date().addMonthFC(month: indexPath.section).startOfMonthFC().getDayOfWeekFC()!+6))"
        }else{
            if(indexPath.row < 7){
                var dayname = ""
                switch (indexPath.row){
                case 0:
                    dayname = "S"
                    break
                    
                case 1:
                    dayname = "M"
                    break
                    
                case 2:
                    dayname = "T"
                    break
                    
                case 3:
                    dayname = "W"
                    break
                    
                case 4:
                    dayname = "T"
                    break
                    
                case 5:
                    dayname = "F"
                    break
                    
                case 6:
                    dayname = "S"
                    break
                    
                default:
                    break
                }
                calendarDay.text = dayname
                calendarDay.textColor = .GroupTextColor()
                calendarDay.font = UIFont.boldSystemFont(ofSize: 16)
            }else{
                calendarDay.text = ""
            }
        }
        cell.view.isHidden = true
        cell.view.layer.cornerRadius = (cell.view.frame.size.width)/2
        if(selectedIndex != nil){
            if(selectedIndex == indexPath){
                cell.view.isHidden = false
                calendarDay.textColor = UIColor.white
//                self.scrollToIndex()
            }
        }
        if(todayIndex != nil){
            if(todayIndex == indexPath){
                cell.view.isHidden = false
                cell.view.backgroundColor = UIColor.GroupTextColor()
                calendarDay.textColor = UIColor.white
//                self.scrollToIndex()
            }
        }else if Int(calendarDay.text!) != nil{
            if(Date().addMonthFC(month: indexPath.section).startOfMonthFC().getDayFC(day: Int(calendarDay.text!)!-1) == selectedDate.getDayFC(day:0)){
                cell.view.isHidden = false
                cell.view.backgroundColor = UIColor.GroupTextColor()
                calendarDay.textColor = UIColor.white
//                    year.text = selectedDate.getYearOnlyFC()
//                    date.text = selectedDate.getTitleDateFC()
                todayDate = Date()
                todayIndex = indexPath
                cell.view.isHidden = false
                calendarDay.textColor = UIColor.white
                let tDate =  Date().addMonthFC(month: indexPath.section).startOfMonthFC().getDayFC(day: Int(calendarDay.text!)!-1)
                //year.text = sDate.getYearOnlyFC()
                contentView.startDateLabel.text = tDate.getTitleDateFC()
                
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((view.frame.width-40)/8), height: CGFloat((view.frame.width-40)/8))
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "calendarHeaderid", for: indexPath) as! calendarHeaderView
        
        let title = headerView.label
        title.text = Date().addMonthFC(month: indexPath.section).getHeaderTitleFC()
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Date().addMonthFC(month: section).getDaysInMonthFC()+Date().addMonthFC(month:section).startOfMonthFC().getDayOfWeekFC()!+6
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell:calendarCell = collectionView.cellForItem(at: indexPath) as! calendarCell
        let calendarDay = cell.label
        if Int(calendarDay.text!) != nil{
            let sDate =  Date().addMonthFC(month: indexPath.section).startOfMonthFC().getDayFC(day: Int(calendarDay.text!)!-1)
            
            
            let selectedSeconds = sDate.timeIntervalSince1970
            let todaySeconds = todayDate.timeIntervalSince1970
            
            checkDate(today: todaySeconds, selected: selectedSeconds, completion: { (code,value) in
                switch code{
                case "former":
                    ShowAlert.OnlyDefault(vc: self, title: "", message: "생성일보다 전은 선택이 불가능합니다.")
                case "excess":
                    ShowAlert.OnlyDefault(vc: self, title: "", message: "생성일로부터 2주까지만 선택 가능합니다.")
                default:
                    self.ltp = value
                    self.ltpString = sDate.getTitleDateFC()
                    cell.view.isHidden = false
                    calendarDay.textColor = UIColor.white
                    //year.text = sDate.getYearOnlyFC()
                    self.contentView.endDateLabel.text = sDate.getTitleDateFC()
                    self.selectedDate = sDate
                    self.selectedIndex = indexPath
                    collectionView.reloadData()
                }
            })
        }
    }
    func checkDate(today:TimeInterval,selected:TimeInterval,completion:@escaping(String,Double)->Void){
        let term = selected - today
        print(term)
        
        if term < 0 {
            completion("former",term)
        }else if term < 3600*24*15{
            completion("complete",term)
        }else{
            completion("excess",term)
        }
        
    }
    
    
    
    
}


extension Date {
    
    func getDaysInMonthFC() -> Int{
        let calendar = Calendar.current
        
        let dateComponents = DateComponents(year: calendar.component(.year, from: self), month: calendar.component(.month, from: self))
        let date = calendar.date(from: dateComponents)!
        
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        
        return numDays
    }
    
    func addMonthFC(month: Int) -> Date {
        return Calendar.current.date(byAdding: .month, value: month, to: self)!
    }
    
    func startOfMonthFC() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonthFC() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonthFC())!
    }
    
    func getDayOfWeekFC() -> Int? {
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: self)
        return weekDay
    }
    
    func getHeaderTitleFC() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM, YYYY"
        return dateFormatter.string(from: self)
    }
    
    func getDayFC(day: Int) -> Date {
        let day = Calendar.current.date(byAdding: .day, value: day, to: self)!
        return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: day)!
    }
    
    
    func getYearOnlyFC() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: self)
    }
    
    func getTitleDateFC() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        return dateFormatter.string(from: self)
    }
}

extension UIView {
    func callRecursively(level: Int = 0, _ body: (_ subview: UIView, _ level: Int) -> Void) {
        body(self, level)
        subviews.forEach { $0.callRecursively(level: level + 1, body) }
    }
}

protocol CalendarCallBack {
    func didSelectDate(date: Date)
}
