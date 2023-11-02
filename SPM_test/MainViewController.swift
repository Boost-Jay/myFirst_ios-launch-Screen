//
//  MainViewController.swift
//  SPM_test
//
//  Created by 王柏崴 on 10/31/23.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var imgHeart: UIImageView!
    @IBOutlet weak var imgFace: UIImageView!
    @IBOutlet weak var lbText: UILabel!
    let gradientLayer = CAGradientLayer()  // 將gradientLayer設為屬性，這樣可以在多個方法中訪問
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 對imgHeart和imgFace進行動畫
        UIView.animate(withDuration: 1.5, animations: {
            self.imgHeart.alpha = 1
            self.imgFace.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 1.0, animations: {
                self.imgHeart.alpha = 0
                self.imgFace.alpha = 0
            }) { _ in
                UIView.animate(withDuration: 3.0) {
                    self.lbText.alpha = 1
                }
            }
        }
    }
    
    func setupUI() {
        lbText.alpha = 0
        lbText.translatesAutoresizingMaskIntoConstraints = false
        
        // 設置圖片視圖的初始狀態
        imgHeart.alpha = 0
        imgFace.alpha = 0
        
        // 初始時設置45度旋轉（不影響動畫）
        imgHeart.transform = CGAffineTransform(rotationAngle: -.pi / 4)
        imgFace.transform = CGAffineTransform(rotationAngle: .pi / 4)
        
        let textLayer = CATextLayer()
        textLayer.string = lbText.text
        textLayer.font = lbText.font
        textLayer.fontSize = lbText.font.pointSize
        textLayer.frame = lbText.bounds
        textLayer.alignmentMode = .center
        textLayer.foregroundColor = UIColor.black.cgColor
        textLayer.isWrapped = true  // 允許文字換行
        textLayer.truncationMode = .end  // 如果文字過長，將會在尾部省略
        gradientLayer.mask = textLayer
        
        
        lbText.textColor = .clear
        lbText.layer.addSublayer(gradientLayer)
    }
    
    func setupGradientLayer() {
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.purple.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = lbText.bounds
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupGradientLayer()  // 確保每次view的布局發生變化時，漸層的大小和位置都會被更新
    }
}


