//
//  AllCommand.swift
//  GameApaka
//
//  Created by Халим Магомедов on 09.12.2021.
//

import Foundation
import UIKit

class AllCommand: UICollectionViewCell {
            
      let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(AllCommandsTableViewCell.self, forCellReuseIdentifier: AllCommandsTableViewCell.identifier)
        //таблица отпускается от верхнего вью
        tableView.contentInset = UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0)
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0)
        return  tableView
    }()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    //MARK: extension - numberOfRowsInSection and cellForRowAt

extension AllCommand: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AllCommandsTableViewCell.identifier, for: indexPath) as! AllCommandsTableViewCell
        for command in AddNewCommandViewController.commands {
                cell.commandLabel.text = command.commandName
                cell.teamFirstNameLabel.text = command.teamName
        }
        DispatchQueue.main.async {
            tableView.reloadData()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.rowHeight = UITableView.automaticDimension
        return 80.0
    }
    
}
