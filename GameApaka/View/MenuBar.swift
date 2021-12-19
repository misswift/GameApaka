import UIKit

class MenuBar: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //добавление  идентификаторов  ячейкам менюбара

    let cellID  = "cellID"
    let userProfileCellID = "userProfileCellID"
    let userDataCellID = "userDataCellID"
    let userSettingsCellID = "userSettingsCellID"
    let menuName = ["Добавить","Команды"]
    var addNewCommandViewController: AddNewCommandViewController?
    
    lazy var  collectionView : UICollectionView =  {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    //устанавливаем на вью collectionView
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellID )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: [] )
        setupHorizontalBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var horizontalBarLeftAnchorConstraint : NSLayoutConstraint?
    
    func setupHorizontalBar() {
        let horizontalBar = UIView()
        horizontalBar.backgroundColor = UIColor(hex: "#EE8C1A")
        horizontalBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBar)
        
        horizontalBarLeftAnchorConstraint = horizontalBar.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        horizontalBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
        horizontalBar.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
//        let x = CGFloat(indexPath.item * Int(frame.width)/2)
//        horizontalBarLeftAnchorConstraint?.constant = x
//        UIView.animate(withDuration: 0.67) {
//            self.layoutIfNeeded()
//        }
        // реакция на касания по менюбару
        addNewCommandViewController?.scrollToMenuIndex(menuIndex: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MenuCell
        cell.label.text = menuName[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width/2, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

class MenuCell: UICollectionViewCell {
    let addNewCommand = AddNewCommand()
    let allCommand = AllCommand()
    let label: UILabel = {
        let lb = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 50))
        lb.textColor = UIColor(hex:  "#3F5C70")
        lb.textAlignment = .right
        return lb
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
            setupViews()
    }
    
    override var isHighlighted : Bool {
        didSet {
            label.textColor = isHighlighted ?  UIColor(hex: "#EE8C1A") : UIColor(hex:  "#3F5C70")
        }
    }
    override var isSelected : Bool {
        didSet {
            label.textColor = isSelected ?   UIColor(hex: "#EE8C1A") : UIColor(hex: "#3F5C70")
        }
    }
    
    func setupViews(){
        backgroundColor = .white
        addSubview(label)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


