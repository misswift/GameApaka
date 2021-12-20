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

    let addNewCommand = AddNewCommand()
    let allCommand = AllCommand()

   lazy var menuBar: MenuBar = {
        let mb = MenuBar()
    // связываем для организации скролла менюбара
        mb.addNewCommandViewController = self
        mb.translatesAutoresizingMaskIntoConstraints = false
        return mb
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let context = getContext()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupView()
    }
    
    // MARK: - save data in CoreData
    
    private func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    private func saveCommand (withTitile title: String){
        let context = getContext()
        guard let entity = NSEntityDescription.entity(forEntityName: "Command", in: context) else {return}
        let commandObject = Commands(entity: entity, insertInto: context)
        if let tfCommandName = addNewCommand.nameCommandTextView.text, let tfTeamName = addNewCommand.nameTextView.text, let tfTeamPhrase =  addNewCommand.phraseTextView.text  {
            self.saveCommand(withTitile: tfCommandName)
            commandObject.commandName = tfCommandName
            commandObject.teamName = tfTeamName
            commandObject.phrase = tfTeamPhrase
        }
        do {
            try context.save()
        } catch let error  as Error {
            print(error.localizedDescription)
        }
    }
    
    
    private func setupView () {
        view.addSubview(menuBar)
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        menuBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        menuBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
    }
   
    //функция отслеживает тап по менюбару главного экрана
    func scrollToMenuIndex(menuIndex: Int){
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        myCollectionView?.scrollToItem(at: indexPath as IndexPath, at: .bottom, animated: true)
    }
    
    func setupCollectionView (){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        view.addSubview(myCollectionView ?? UICollectionView())
        myCollectionView?.backgroundColor = UIColor.white
        myCollectionView?.isPagingEnabled = true
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
        if let layout = myCollectionView?.collectionViewLayout  as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
        }
        myCollectionView?.register(AddNewCommand.self, forCellWithReuseIdentifier: "addNewCommandCellID")
        myCollectionView?.register(AllCommand.self, forCellWithReuseIdentifier: "allCommandCellID")
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: .left)
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

