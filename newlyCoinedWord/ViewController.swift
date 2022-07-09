//
//  ViewController.swift
//  newlyCoinedWord
//
//  Created by HeecheolYoon on 2022/07/09.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    @IBOutlet weak var fourthBtn: UIButton!
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBOutlet weak var resultImgView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var searchBar: UITextField!
    
    let newWordDic: [String: String] = ["스불재": "스스로 불러온 재앙", "갓생": "God과 인생을 합친 말로, 열심히 사는 사람한테 쓰는 말", "삼귀다": "사귀기 전의 썸타는 단계", "점메추": "점심 메뉴 추천좀", "구취": "구독 취소", "캘박": "캘린더 박제", "식집사": "식물을 기르는 사람", "많관부": "많은 관심 부탁드립니다", "팬아저": "팬이 아니어도 저장", "갑통알": "갑자기 통장보니 알바해야겠다", "사바사": "사람 by 사람이라는 뜻으로, 경우에 따라 다르다는 것을 의미"]
    var newWord: [String] = ["스불재", "갓생", "삼귀다", "점메추", "구취", "캘박", "식집사", "많관부", "팬아저", "갑통알", "사바사"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newWord.shuffle()
        
        searchBar.delegate = self
        
        // 검색창 아래 버튼 UI
        settingBtn(firstBtn, title: newWord[0])
        settingBtn(secondBtn, title: newWord[1])
        settingBtn(thirdBtn, title: newWord[2])
        settingBtn(fourthBtn, title: newWord[3])
        
        // 검색창 뷰 UI
        topView.layer.borderWidth = 2
        topView.layer.borderColor = UIColor.black.cgColor
        
        // 검색버튼
        searchBtn.backgroundColor = .black
        searchBtn.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchBtn.tintColor = .white
        
        // 검색 결과 보여주는 이미지뷰
        resultImgView.image = UIImage(named: "배경")
        resultImgView.contentMode = .scaleToFill
        
        // 검색 결과 레이블
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 0
        resultLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        // 텍스트필드
        searchBar.placeholder = "신조어를 입력하세요."
    }
    
    func settingBtn(_ button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 10
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // 키보드 내리기
        textField.resignFirstResponder()
        
        // 검색 결과 띄우기
        if let text = textField.text {
            resultLabel.text = newWordDic[text]
        }
        
        newWord.shuffle()
        
        firstBtn.setTitle(newWord[0], for: .normal)
        secondBtn.setTitle(newWord[1], for: .normal)
        thirdBtn.setTitle(newWord[2], for: .normal)
        fourthBtn.setTitle(newWord[3], for: .normal)
        
        return true
    }
    
    @IBAction func tapSearchBtn(_ sender: UIButton) {
        view.endEditing(true)
        
        if let text = searchBar.text {
            resultLabel.text = newWordDic[text]
        }
        
        newWord.shuffle()
        
        firstBtn.setTitle(newWord[0], for: .normal)
        secondBtn.setTitle(newWord[1], for: .normal)
        thirdBtn.setTitle(newWord[2], for: .normal)
        fourthBtn.setTitle(newWord[3], for: .normal)
        
    }
    
    @IBAction func tapFirstBtn(_ sender: UIButton) {
    
        searchBar.text = newWord[0]
        resultLabel.text = newWordDic[newWord[0]]
        
    }
    @IBAction func tapSecondBtn(_ sender: UIButton) {
        
        searchBar.text = newWord[1]
        resultLabel.text = newWordDic[newWord[1]]
        
    }
    @IBAction func tapThirdBtn(_ sender: UIButton) {
        
        searchBar.text = newWord[2]
        resultLabel.text = newWordDic[newWord[2]]
        
    }
    @IBAction func tapFourthBtn(_ sender: UIButton) {
        
        searchBar.text = newWord[3]
        resultLabel.text = newWordDic[newWord[3]]
        
    }
    
}

