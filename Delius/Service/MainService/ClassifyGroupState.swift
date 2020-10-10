//
//  ClassifyGroupState.swift
//  Delius
//
//  Created by user on 2020/08/15.
//  Copyright © 2020 정윤환. All rights reserved.
//

class ClassifyGroupState{
    
    static func group2State(groupData:GLStruct,inputState:Int)->ClassifyGroupStruct{
        var like = 0
        var deli = 0
        var reject = 0
        
        for member in groupData.mid!{
            let index = member["ind"] as! Int
            if index == 300{
                like += 1
            }
            if index == 400{
                deli += 1
            }
            if index == 701 || index == 702, index == 703 || index == 704{
                reject += 1
            }
            if index == 901{
                reject += 1
            }
        }
        if reject == 1 && like + deli == 0{
            if inputState == 901{
                return ClassifyGroupStruct(cash: false, groupUpdate: true, index: 1000)
            }
        }
        if like + deli == 1{
            if deli > 0{
                if inputState == 300 || inputState == 400{
                    return ClassifyGroupStruct(cash: false, groupUpdate: true, index: 400)
                }else{
                   return ClassifyGroupStruct(cash: false, groupUpdate: true, index: 1000)
                }
            }else{
                if inputState == 300 || inputState == 400{
                    return ClassifyGroupStruct(cash: true, groupUpdate: true, index: inputState)
                }else{
                    return ClassifyGroupStruct(cash: false, groupUpdate: true, index: 1000)
                }
            }
        }
        return ClassifyGroupStruct()
    }
    static func group3State(groupData:GLStruct,inputState:Int)->ClassifyGroupStruct{
        var like = 0
        var deli = 0
        var reject = 0
        
        for member in groupData.mid!{
            let index = member["ind"] as! Int
            if index == 300{
                like += 1
            }
            if index == 400{
                deli += 1
            }
            if index == 701 || index == 702, index == 703 || index == 704{
                reject += 1
            }
            if index == 801{
                
            }
            if index == 901{
                reject += 1
            }
        }
        if like + deli == 1 && reject == 0{
            if deli > 0{
                if inputState == 300 || inputState == 400{
                    return ClassifyGroupStruct(cash: false, groupUpdate: true, index: 400)
                }else{
                    return ClassifyGroupStruct(cash: false, groupUpdate: false, index: 0)
                }
            }else{
                if inputState == 300 || inputState == 400{
                    return ClassifyGroupStruct(cash: true, groupUpdate: true, index: inputState)
                }else{
                    return ClassifyGroupStruct(cash: false, groupUpdate: false, index: 0)
                }
            }
        }
        if like + deli == 1 && reject == 1{
            if deli > 0{
                if inputState == 300 || inputState == 400{
                    return ClassifyGroupStruct(cash: false, groupUpdate: true, index: 400)
                }else{
                    return ClassifyGroupStruct(cash: false, groupUpdate: true, index: 1000)
                }
            }else{
                if inputState == 300 || inputState == 400{
                    return ClassifyGroupStruct(cash: true, groupUpdate: true, index: inputState)
                }else{
                    return ClassifyGroupStruct(cash: false, groupUpdate: true, index: 1000)
                }
            }
        }
        if like + deli == 0 && reject == 1{
            if inputState == 300 || inputState == 400{
                return ClassifyGroupStruct(cash: true, groupUpdate: false, index: inputState)
            }else{
                return ClassifyGroupStruct(cash: false, groupUpdate: false, index: inputState)
            }
        }
        
        return ClassifyGroupStruct()
    }
    static func group4State(groupData:GLStruct,inputState:Int)->ClassifyGroupStruct{
        var like = 0
        var deli = 0
        var reject = 0
        
        for member in groupData.mid!{
            let index = member["ind"] as! Int
            if index == 300{
                like += 1
            }
            if index == 400{
                deli += 1
            }
            if index == 701 || index == 702, index == 703 || index == 704{
                reject += 1
            }
            if index == 801{
                
            }
            if index == 901{
                reject += 1
            }
        }
        if like + deli == 0 && reject == 0{
            return ClassifyGroupStruct(cash: false, groupUpdate: false, index: 0)
            
        }
        if like + deli == 0 && reject == 1{
            if inputState == 300 || inputState == 400{
                return ClassifyGroupStruct(cash: true, groupUpdate: false, index: 0)
            }else{
                return ClassifyGroupStruct(cash: false, groupUpdate: true, index: 1000)
            }
            
        }
        if like + deli == 1 && reject == 0{

            if inputState == 300 || inputState == 400{
                return ClassifyGroupStruct(cash: false, groupUpdate: false, index: 0)
            }else{
                return ClassifyGroupStruct(cash: false, groupUpdate: false, index: 0)
            }
        }
        if like + deli == 1 && reject == 1{
            if inputState == 300 || inputState == 400 {
                return ClassifyGroupStruct(cash: false, groupUpdate: false, index: 0)
            }else{
                return ClassifyGroupStruct(cash: false, groupUpdate: true, index: 1000)
            }
        }
        if like + deli == 2 && reject == 0{
            if deli > 0{
                if inputState == 300 || inputState == 400{
                    return ClassifyGroupStruct(cash: false, groupUpdate: true, index: 400)
                }else{
                    return ClassifyGroupStruct(cash: false, groupUpdate: false, index: 0)
                }
            }else{
                if inputState == 300 || inputState == 400{
                    return ClassifyGroupStruct(cash: true, groupUpdate: false, index: inputState)
                }else{
                    return ClassifyGroupStruct(cash: false, groupUpdate: false, index: 0)
                }
            }
        }
        if like + deli == 2 && reject == 1{
            if deli > 0{
                if inputState == 300 || inputState == 400{
                    return ClassifyGroupStruct(cash: false, groupUpdate: true, index: 400)
                }else{
                    return ClassifyGroupStruct(cash: false, groupUpdate: true, index: 1000)
                }
            }else{
                if inputState == 300 || inputState == 400{
                    return ClassifyGroupStruct(cash: true, groupUpdate: false, index: inputState)
                }else{
                    return ClassifyGroupStruct(cash: false, groupUpdate: true, index: 1000)
                }
            }
        }
        return ClassifyGroupStruct()
        
    }
}
