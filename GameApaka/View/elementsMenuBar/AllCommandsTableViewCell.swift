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
       // contentView.backgroundColor = .orange
        contentView.addSubview(commandLabel)
        contentView.addSubview(teamFirstNameLabel)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let commandLabel: UILabel  = {
        let cl = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 150))
        cl.text = "Команда 1"
        cl.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return cl
    }()
    
    let teamFirstNameLabel: UILabel  = {
        let cl = UILabel(frame: CGRect(x: 110, y: 0, width: 100, height: 150))
        cl.text = "Игрок 1"
        cl.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return cl
    }()
    
    
}
