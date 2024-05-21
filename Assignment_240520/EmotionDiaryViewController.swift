//
//  EmotionDiaryViewController.swift
//  Assignment_240520
//
//  Created by 김상규 on 5/20/24.
//

import UIKit

class EmotionDiaryViewController: UIViewController {
    
    @IBOutlet var navigationTitle: UINavigationItem!
    
    @IBOutlet var explainLabel: UILabel!
    
    @IBOutlet var emotionLabelList: [UILabel]!
    @IBOutlet var emotionButtonList: [UIButton]!
    
    var imgNameArr: [String] = ["slime1","slime2","slime3","slime4","slime5","slime6","slime7","slime8","slime9"]
    
    let emotions = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "공허해", "후회해"]
    
    var values = [0,0,0,0,0,0,0,0,0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }
    
    func makeUI() {
        
        view.backgroundColor = .lightGray
        
        navigationTitle.title = "감정 다이어리"
        makeExplainLabelUI(text: "오늘 느낀 감정을 클릭해주세요!")
        
        let imgArr = imgNameArr.map { str in
            UIImage(named: str)!.withRenderingMode(.alwaysOriginal)
        }
        
        for i in 0...emotions.count-1 {
            makeEmotionUI(button: emotionButtonList[i], image: imgArr[i], label: emotionLabelList[i], text: emotions[i])
        }
    }
    
    func makeEmotionUI(button: UIButton, image: UIImage, label: UILabel, text: String) {
        button.setImage(image, for: .normal)
        label.text = text
        label.textAlignment = .center
    }
    
    func makeExplainLabelUI(text: String) {
        explainLabel.text = text
        explainLabel.font = .systemFont(ofSize: 13)
        explainLabel.textAlignment = .center
    }
    
    @IBAction func emotionTapped(_ sender: UIButton) {
        print(sender.tag)
        values[sender.tag] += 1
        
        emotionLabelList[sender.tag].text = "\(emotions[sender.tag]) \(values[sender.tag])"
    }
}
