//
//  ViewController.swift
//  DucumentReader
//
//  Created by XCODE on 2017/5/8.
//  Copyright © 2017年 Gjun. All rights reserved.
//

import UIKit
import QuickLook

class ViewController: UIViewController {
    
    enum ButtonTag: Int {
        case pdf = 1, excel, word, ppt
    }
    
    var document = [URL]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        func button(frame: CGRect, title: String, tag: ButtonTag) -> UIButton {
            let button = UIButton(frame: frame)
            button.setTitle(title, for: .normal)
            button.setTitleColor(UIColor.darkGray, for: .normal)
            button.layer.cornerRadius = 8.0
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.darkGray.cgColor
            button.addTarget(self, action: #selector(self.onButtonAction(_:)), for: .touchUpInside)
            button.tag = tag.rawValue
            return button
        }
        
        let pdfButton = button(
            frame: CGRect(x: 40, y: 200, width: UIScreen.main.bounds.width - 80, height: 40),
            title: "pdf",
            tag: .pdf
        )
        self.view.addSubview(pdfButton)
        
        let excelButton = button(
            frame: CGRect(x: 40, y: 250, width: UIScreen.main.bounds.width - 80, height: 40),
            title: "excel",
            tag: .excel
        )
        self.view.addSubview(excelButton)
        
        let wordButton = button(
            frame: CGRect(x: 40, y: 300, width: UIScreen.main.bounds.width - 80, height: 40),
            title: "word",
            tag: .word
        )
        self.view.addSubview(wordButton)
        
        let pptButton = button(
            frame: CGRect(x: 40, y: 350, width: UIScreen.main.bounds.width - 80, height: 40),
            title: "powerpoint",
            tag: .ppt
        )
        self.view.addSubview(pptButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func onButtonAction(_ sender: UIButton) {
        guard let tag = ButtonTag(rawValue: sender.tag) else { return }
        switch tag {
        case .pdf:
            self.document.removeAll()
            var file: String
            file = "coreAnimation.pdf"
            if let path = Bundle.main.path(forResource: file, ofType: nil) {
                let url = URL(fileURLWithPath: path)
                self.document.append(url)
            }
            file = "001.pdf"
            if let path = Bundle.main.path(forResource: file, ofType: nil) {
                let url = URL(fileURLWithPath: path)
                self.document.append(url)
            }
            file = "002.pdf"
            if let path = Bundle.main.path(forResource: file, ofType: nil) {
                let url = URL(fileURLWithPath: path)
                self.document.append(url)
            }
            file = "003.pdf"
            if let path = Bundle.main.path(forResource: file, ofType: nil) {
                let url = URL(fileURLWithPath: path)
                self.document.append(url)
            }
            self.ativateQLPreviewController()
        case .excel:
            self.document.removeAll()
            var file: String
            file = "xxx.xlsx"
            if let path = Bundle.main.path(forResource: file, ofType: nil) {
                let url = URL(fileURLWithPath: path)
                self.document.append(url)
            }
            file = "xxx.csv"
            if let path = Bundle.main.path(forResource: file, ofType: nil) {
                let url = URL(fileURLWithPath: path)
                self.document.append(url)
            }
            self.ativateQLPreviewController()
        case .word:
            self.document.removeAll()
            var file: String
            file = "xxx.docx"
            if let path = Bundle.main.path(forResource: file, ofType: nil) {
                let url = URL(fileURLWithPath: path)
                self.document.append(url)
            }
            self.ativateQLPreviewController()
        case .ppt:
            self.document.removeAll()
            var file: String
            file = "xxx.pptx"
            if let path = Bundle.main.path(forResource: file, ofType: nil) {
                let url = URL(fileURLWithPath: path)
                self.document.append(url)
            }
            file = "xxx.pages"
            if let path = Bundle.main.path(forResource: file, ofType: nil) {
                let url = URL(fileURLWithPath: path)
                self.document.append(url)
            }
            self.ativateQLPreviewController()
        }
    }
    
    private func ativateQLPreviewController() {
        let qlPreviewController = QLPreviewController()
        qlPreviewController.delegate = self
        qlPreviewController.dataSource = self
        qlPreviewController.currentPreviewItemIndex = 0
        self.present(qlPreviewController, animated: true, completion: nil)
    }

}

extension ViewController: QLPreviewControllerDelegate {
    
}

extension ViewController: QLPreviewControllerDataSource {
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return self.document.count
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return self.document[index] as QLPreviewItem
    }
    
}
















