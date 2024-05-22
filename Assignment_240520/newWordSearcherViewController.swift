//
//  newWordSearcherViewController.swift
//  Assignment_240520
//
//  Created by 김상규 on 5/20/24.
//

import UIKit

class newWordSearcherViewController: UIViewController {
    
    @IBOutlet var newWordTabTitle: UINavigationItem!
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    @IBOutlet var newWordButtonList: [UIButton]!
    
    @IBOutlet var wordMeaningLabelImage: UIImageView!
    @IBOutlet var wordMeaningLabel: UILabel!
    
    var nWdic: [String: String] = ["무물보": "무엇이든 물어보세요", "말또서": "말 또 서운하게 하네", "분조카": "분위기 좋은 카페", "비담": "비주얼 담당", "싫존": "싫어도 존중해달라", "이선좌": "이미 선택된 좌석입니다", "쩝쩝박사": "음식 조합을 잘 맞추는 사람", "트민남": "트렌드에 민감한 남자", "sbn": "선배님", "스불재": "스스로 불러온 재앙", ]
    
    var newDicKeys: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 해당 탭으로 넘어갈 때 노출할 신조어 미리 셔플
        makeUI()
        wordShuffle()
    }
    
    func makeUI() {
        
        newWordTabTitle.title = "신조어 사전"
        searchesUI()
        searchResultUI()
    }
    
    // search와 관련된 UI
    func searchesUI() {
        searchTextField.placeholder = "단어를 검색해 보세요"
        searchTextField.borderStyle = .roundedRect
        searchTextField.backgroundColor = .white
        searchTextField.returnKeyType = .search
        searchTextField.autocorrectionType = .no
        
        let image = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate)
        searchButton.setImage(image, for: .normal)
        searchButton.tintColor = .white
        searchButton.titleLabel?.textAlignment = .center
        searchButton.backgroundColor = .black
        searchButton.layer.cornerRadius = 5
        
        newDicKeys = nWdic.keys.shuffled()
    }
    
    // 텍스트필드 밑 신조어 버튼 UI
    func newWordButtonUI(button: UIButton, word: String) {
        button.setTitle(word, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        button.tintColor = .darkGray
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
    }
    
    // 검색 결과 UI
    func searchResultUI() {
        wordMeaningLabelImage.image = UIImage(named: "background")!.withRenderingMode(.alwaysOriginal)
        wordMeaningLabelImage.contentMode = .scaleToFill
        wordMeaningLabel.text = ""
        wordMeaningLabel.font = .systemFont(ofSize: 18)
        wordMeaningLabel.numberOfLines = 5
        
        NSMutableParagraphStyle().lineSpacing = 3 // 행간 조절
    }
    
    // 검색버튼 결과 표시
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
        // 텍스트필드.endEditing(Bool): 키보드 내림 메서드
        searchTextField.endEditing(true)
        searchLogic()
    }
    
    // 텍스트필드 밑의 신조어 버튼 클릭 동작
    @IBAction func newWordButtonTapped(_ sender: UIButton) {
        searchTextField.text =  sender.titleLabel?.text
        
    }
    
    // 텍스트필드 키보드 버튼으로 결과 표시
    @IBAction func returnButtonTapped(_ sender: UITextField) {
        searchLogic()
    }
    
    // 신조어 딕셔너리 키 셔플 함수
    func wordShuffle() {
        newDicKeys = nWdic.keys.shuffled()
        
        // 셔플 후 다시 할당
        for button in newWordButtonList {
            button.setTitle(newDicKeys[0], for: .normal)
            button.setTitle(newDicKeys[1], for: .normal)
            button.setTitle(newDicKeys[2], for: .normal)
            button.setTitle(newDicKeys[3], for: .normal)
        }
        
        for i in 0...newWordButtonList.count-1{
            newWordButtonUI(button: newWordButtonList[i], word: newDicKeys[i])
        }
    }
    
    // 검색 로직
    func searchLogic() {
        let word = searchTextField.text!
        let word2 = nWdic[word] ?? ""
        
        if !word.isEmpty {
            if !word2.isEmpty {
                wordMeaningLabel.text =  word2
            } else {
                wordMeaningLabel.text = "검색 결과가 없습니다."
            }
            
            wordShuffle()
        } else {
            searchTextField.placeholder = "한글자 이상 작성해주세요."
        }
    }
}
