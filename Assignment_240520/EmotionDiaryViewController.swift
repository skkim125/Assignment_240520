//
//  EmotionDiaryViewController.swift
//  Assignment_240520
//
//  Created by 김상규 on 5/20/24.
//

import UIKit

class EmotionDiaryViewController: UIViewController {
    
    @IBOutlet var explainLabel: UILabel!
    
    @IBOutlet var emotionLabelList: [UILabel]!
    @IBOutlet var emotionButtonList: [UIButton]!
    
    var imgNameArr: [String] = ["slime1","slime2","slime3","slime4","slime5","slime6","slime7","slime8","slime9"]
    
    let emotions = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "공허해", "후회해"]
    
    var values = [0,0,0,0,0,0,0,0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBarUI()
        makeAllUI()
    }
    
    
    func navigationBarUI() {
        navigationItem.title = "감정 다이어리"
        
        let resetButton = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(reset))
        navigationItem.rightBarButtonItem = resetButton
        navigationItem.rightBarButtonItem?.tintColor = .red
    }
    
    @objc func reset() {
        values = [0,0,0,0,0,0,0,0,0]
        for v in 0...values.count-1 {
            UserDefaults.standard.set(values[v], forKey: "\(emotions[v])")
            emotionLabelList[v].text = "\(emotions[v]) \(values[v])"
        }
    }
    
    
    func makeAllUI() {
        
        view.backgroundColor = .lightGray
        
        makeExplainLabelUI(text: "오늘 느낀 감정을 클릭해주세요!")
        
        let imgArr = imgNameArr.map { str in
            UIImage(named: str)!.withRenderingMode(.alwaysOriginal)
        }
        
        for i in 0...emotions.count-1 {
            let num = UserDefaults.standard.integer(forKey: "\(emotions[i])")
            
            makeEmotionButton(button: emotionButtonList[i], image: imgArr[i])
            makeEmotionLabel(label: emotionLabelList[i], text: "\(emotions[i]) \(num)")
        }
    }
    
    func makeEmotionLabel(label: UILabel, text: String) {
        label.text = text
        label.textAlignment = .center
    }
    
    
    func makeEmotionButton(button: UIButton, image: UIImage) {
        button.setImage(image, for: .normal)
    }
    
    func makeExplainLabelUI(text: String) {
        explainLabel.text = text
        explainLabel.font = .systemFont(ofSize: 13)
        explainLabel.textAlignment = .center
    }
    
    @IBAction func emotionTapped(_ sender: UIButton) {
        let tag = sender.tag
        
        for v in 0...values.count-1 {
            values[v] = UserDefaults.standard.integer(forKey: "\(emotions[tag])")
        }
        values[tag] += 1
        
        print(values[tag])

        UserDefaults.standard.set(values[tag], forKey: "\(emotions[tag])")
        
        emotionLabelList[tag].text = "\(emotions[tag]) \(values[tag])"
    }
}
