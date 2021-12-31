//
//  AddNewCommandViewController.swift
//  GameApaka
//
//  Created by Халим Магомедов on 07.12.2021.
//

import UIKit
import CoreData

protocol AddNewCommandInput{
    //var output:AddNewCommandOutput { get  }
}

protocol AddNewCommandOutput{
    func userCreateCommand(commandName:String, commandTeam: [Commands] )
}

class AddNewCommandViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, AddNewCommandInput {
   // var output: AddNewCommandOutput
    
   
    static var commands: [Commands] = []
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
    
    lazy var navBar: UINavigationBar = {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        navBar.backgroundColor = .white
         self.title = "ggg"
         return navBar
     }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let context = getContext()
        let fetchRequest: NSFetchRequest<Commands> = Commands.fetchRequest()
        do {
            AddNewCommandViewController.commands = try context.fetch(fetchRequest)
        } catch let error  as Error {
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [navBar, menuBar].forEach {view.addSubview($0)}
        view.addSubview(navBar)
        let navItem = UINavigationItem(title: "SomeTitle")
        navBar.setItems([navItem], animated: false)
        setupCollectionView()
        addMenuBarConstraint()
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
            DispatchQueue.main.async {
                AddNewCommandViewController.commands.append(commandObject)
            }
        } catch let error  as Error {
            print(error.localizedDescription)
        }
    }
    
    
    private func addMenuBarConstraint () {
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

