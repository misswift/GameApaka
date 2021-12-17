//
//  AddNewCommand.swift
//  GameApaka
//
//  Created by Халим Магомедов on 07.12.2021.
//

import Foundation
import UIKit

@IBDesignable //маска для быстрого просмотра изменений в классе


class AddNewCommand: UICollectionViewCell {
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func layoutSubviews() {
        //добавляем наши вью для отображания
        addSubview(nameTextView)
        addSubview(phraseTextView)
        addSubview(commandLabel)
        addSubview(nameCommandTextView)
        addSubview(addNewTeamButton)


        // addSubview(button)
        // layer.mask = shapeLayer
    }
    let commandLabel: UILabel  = {
        let cl = UILabel(frame: CGRect(x: 25, y: 130, width: 320, height: 50))
        cl.text = "Команда 1"
        cl.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return cl
    }()
    
    let nameCommandTextView: UITextView = {
        let textView = UITextView(borderWidth: 1, borderColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor, font: 17)
        textView.frame = CGRect(x: 25, y: 180, width: 320, height: 50)
        let notePlaceholder: UILabel = {
            let notePlaceholder = UILabel()
            notePlaceholder.text = "Название команды"
            return notePlaceholder
        }()
        textView.addPlaceholder(notePlaceholder)
        return textView
    }()
    
    let nameTextView: UITextView = {
        let textView = UITextView(borderWidth: 1, borderColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor, font: 17)
        textView.frame = CGRect(x: 25, y: 250, width: 320, height: 50)
        textView.contentInset = UIEdgeInsets(top: 25, left: 10, bottom: 0, right: 0)
        let notePlaceholder: UILabel = {
            let notePlaceholder = UILabel()
            notePlaceholder.text = "Имя участника"
            return notePlaceholder
        }()
        textView.addPlaceholder(notePlaceholder)
        return textView
    }()
    
    let phraseTextView: UITextView = {
        let textView = UITextView(borderWidth: 1, borderColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor, font: 17)
        textView.contentInset = UIEdgeInsets(top: 25, left: 10, bottom: 0, right: 0)
        textView.frame =  CGRect(x: 25, y: 320, width: 320, height: 50)
        let notePlaceholder: UILabel = {
            let notePlaceholder = UILabel()
            notePlaceholder.text = "Фраза"
            return notePlaceholder
        }()
        textView.addPlaceholder(notePlaceholder)
        return textView
    }()
    
    let addNewTeamButton: UIButton = {
        let addBut = UIButton(cornerRadius: 10, title: "Добавить участника", borderWidth: 0, borderColor: nil)
        addBut.frame =  CGRect(x: 25, y: 390, width: 320, height: 50)
        addBut.backgroundColor = #colorLiteral(red: 0.1943593468, green: 0.2369306087, blue: 0.2090644169, alpha: 1)
        addBut.setTitleColor(.white, for: .normal)
        return addBut
    }()
    
//    @objc func deleteCommand(sender: UIButton){
//        nameTextView.text = nil
//        ageTextView.text = nil
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

