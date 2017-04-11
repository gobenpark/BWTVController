//Copyright (c) 2017 qkrqjadn <qjadn0914@naver.com>
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.


import UIKit

public enum expandType {
    case expand
    case reduce
}

open class BWTVHeaderView: UIView {
    
    open var arrowImg: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    open var expandState: expandType = .reduce{
        didSet{
            UIView.animate(withDuration: 0.2) {
                if self.expandState == .reduce{
                    self.arrowImg.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/180))
                } else {
                    self.arrowImg.transform = CGAffineTransform(rotationAngle: CGFloat(-180 * Double.pi/180) )
                }
            }
        }
    }
    open var childRows: Int?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(arrowImg)
        
        if #available(iOS 9.0, *) {
            self.arrowImg.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
            self.arrowImg.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

