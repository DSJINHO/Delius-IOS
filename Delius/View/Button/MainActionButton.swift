
import UIKit

class MainActionButton:UIButton{
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(imgName:String,color:UIColor,frame: CGRect) {
        super.init(frame:frame)
        translatesAutoresizingMaskIntoConstraints = false
        tintColor = color
        
        
        let inset = frame.height/4
        imageEdgeInsets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        setImage(UIImage(named: imgName), for: .normal)
        self.imageView!.contentMode = .scaleAspectFit
    }
}
