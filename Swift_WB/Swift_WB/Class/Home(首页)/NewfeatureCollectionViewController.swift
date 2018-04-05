//
//  NewfeatureCollectionViewController.swift
//  Swift_WB
//
//  Created by Liu on 2018/4/1.
//  Copyright © 2018年 Mr Liu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cellsadasd"

class NewfeatureCollectionViewController: UICollectionViewController {

    private let pageCount = 4
    private var layout: UICollectionViewLayout = NewfeatureLayout()
    
    init()
    {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(NewfeatureCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return pageCount
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewfeatureCell
    
        cell.imageIndex = indexPath.item
        return cell
    }
    // 完全显示一个cell之后调用
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let path = collectionView.indexPathsForVisibleItems.last!
        print(path)
        if path.item == (pageCount - 1)
        {
            let cell = collectionView.cellForItem(at: path) as! NewfeatureCell
            cell.starBtnAnimation()
        }
    }

}
private class NewfeatureCell: UICollectionViewCell
{
    func starBtnAnimation()  {
        
        starButton.isHidden = false
        
        // 执行动画
        starButton.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        starButton.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 10, options: UIViewAnimationOptions.init(rawValue: 0), animations: {
            self.starButton.transform = .identity
        }, completion: { (_) in
            self.starButton.isUserInteractionEnabled = true
        })
    }
    
    fileprivate var imageIndex: Int?{
        didSet{
           iconView.image = UIImage.init(named: "new_feature_\(imageIndex! + 1)")
            
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI()  {
        contentView.addSubview(iconView)
        contentView.addSubview(starButton)
        iconView.HB_Fill(referView: contentView)
        
        starButton.HB_AlignVertical(type: .BottomCenter, referView: contentView, size: nil, offset: CGPoint.init(x: 0, y: -160))
    }
    private lazy var iconView = UIImageView()
    private lazy var starButton: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage.init(named: "new_feature_button"), for: .normal)
        btn.setBackgroundImage(UIImage.init(named: "new_feature_button_highlighted"), for: .highlighted)
        btn.isHidden = true
        btn.addTarget(self, action: #selector(customBtnClick), for: .touchUpInside)
        
        return btn
    }()
    func customBtnClick()
    {
        print("-----")
    }
}
private class NewfeatureLayout: UICollectionViewFlowLayout
{
    override func prepare() {
        itemSize = UIScreen.main.bounds.size
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .horizontal
        
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.bounces = false
        collectionView?.isPagingEnabled = true
    }
}


























