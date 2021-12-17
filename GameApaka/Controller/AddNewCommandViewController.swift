//
//  AddNewCommandViewController.swift
//  GameApaka
//
//  Created by Халим Магомедов on 07.12.2021.
//

import UIKit
import CoreData



class AddNewCommandViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    
    var context: NSManagedObjectContext!

    var myCollectionView: UICollectionView?
    let addNewCommandCellID = "addNewCommandCellID"
    let allCommandCellID = "allCommandCellID"

//    let addNewCommand = AddNewCommand()
//    let allCommand = AllCommand()

    let menuBar: MenuBar = {
        let mb = MenuBar()
        mb.translatesAutoresizingMaskIntoConstraints = false
        return mb
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView?.backgroundColor = UIColor.white
        view.addSubview(myCollectionView ?? UICollectionView())
        
        //self.view = view
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        
        self.navigationItem.title = "КОМАНДЫ"
        self.view.backgroundColor = .white
        
        myCollectionView?.isPagingEnabled = true

        setupView()
        setupCollectionView()
    }
    
    private func setupView () {
        view.addSubview(menuBar)
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        menuBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        menuBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
    }
    
    func scrollToMenuIndex(menuIndex: Int){
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        myCollectionView?.scrollToItem(at: indexPath as IndexPath, at: .bottom, animated: true)
    }
    
    func setupCollectionView (){
        myCollectionView?.register(AddNewCommand.self, forCellWithReuseIdentifier: "addNewCommandCellID")
        myCollectionView?.register(AllCommand.self, forCellWithReuseIdentifier: "allCommandCellID")
        myCollectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        myCollectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0
                {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: addNewCommandCellID, for: indexPath) as! AddNewCommand
                    return cell
                }
                else
                {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: allCommandCellID, for: indexPath) as! AllCommand
                    return cell
                }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {        return CGSize( width: view.frame.width, height: view.frame.height )
        //(view.frame.width, height + 16 + 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

