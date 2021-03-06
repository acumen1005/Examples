//
//  TapGestureTableViewCell.swift
//  UITextViewLinkClick
//
//  Created by acumen on 2017/12/4.
//  Copyright © 2017年 acumen. All rights reserved.
//

import UIKit

class TapGestureTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.textColor = UIColor.black
        textView.isEditable = false
        textView.isUserInteractionEnabled = true
        textView.isSelectable = true
        textView.delegate = self
        textView.dataDetectorTypes = [.all]
        textView.delaysContentTouches = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapAction))
        textView.addGestureRecognizer(tap)
    }

    @objc func handleTapAction(_ tapGesture: UITapGestureRecognizer) {
        let textView = tapGesture.view as! UITextView
        let tapLocation = tapGesture.location(in: textView)
        let textPosition = textView.closestPosition(to: tapLocation)
        let attr: NSDictionary = textView.textStyling(at: textPosition!, in: UITextStorageDirection.forward)! as NSDictionary
        
        if let url: URL = attr[NSAttributedStringKey.link] as? URL {
            UIApplication.shared.openURL(url as URL)
        }
    }
    
    func renderTextView(text: String) {
        self.textView.attributedText = setLineSpacing(text: text, space: 5)
        self.textView.text = text
    }
    
    func setLineSpacing(text: String, space: CGFloat) -> NSAttributedString {
        let mutableAttr = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = space
        mutableAttr.addAttribute(NSAttributedStringKey.paragraphStyle,
                                 value: paragraphStyle,
                                 range: NSRange(location: 0, length: text.count))
        mutableAttr.addAttribute(NSAttributedStringKey.font,
                                 value: UIFont.systemFont(ofSize: 18),
                                 range: NSRange(location: 0, length: text.count))
        return mutableAttr as NSAttributedString
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension TapGestureTableViewCell: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        print("[TapGestureTableViewCell] shouldInteractWith - ")
        return true
    }
    
    @available(iOS 10.0, *)
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print("[TapGestureTableViewCell] shouldInteractWith:interaction - ")
        return true
    }
}
