//
//  AllCommandsTableViewCell.swift
//  GameApaka
//
//  Created by Халим Магомедов on 17.12.2021.
//

import UIKit

class AllCommandsTableViewCell: UITableViewCell {
    
    static let identifier = "AllCommandsTVCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.cornerRadius = 6
        contentView.addSubview(commandLabel)
        contentView.addSubview(teamFirstNameLabel)
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var commandLabel: UILabel  = {
        let cl = UILabel(frame: CGRect(x: 15, y: 0, width: 100, height: 50))
        cl.text = "Команда 1"
        cl.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return cl
    }()
    
    lazy var teamFirstNameLabel: UILabel  = {
        let cl = UILabel(frame: CGRect(x: 110, y: 0, width: 100, height: 50))
        cl.text = "Игрок 1"
        cl.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return cl
    }()
    
    
}
