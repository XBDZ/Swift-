//
//  HomeStatusCell.swift
//  Swift_WB
//
//  Created by Liu on 2018/4/9.
//  Copyright © 2018年 Mr Liu. All rights reserved.
//

import UIKit
import SDWebImage

class HomeStatusCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
              setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var status: Status?{
        
        didSet{
            nameLabel.text = status?.user?.name
            timeLabel.text = status?.created_at
            sourceLabel.text = "来自: 小霸王学习机"
            contentLabel.text = status?.text
            
            if let url = status?.user?.imageURL {
                iconView.sd_setImage(with: url as URL, completed: nil)
            }
        }
    }
    
    func setUI()  {
        contentView.addSubview(iconView)
        contentView.addSubview(verifiedView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(vipView)
        contentView.addSubview(timeLabel)
        contentView.addSubview(sourceLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(footerView)
        footerView.backgroundColor = UIColor(white: 0.2, alpha: 0.5)
        
        
        iconView.HB_AlignInner(type: HB_AlignType.TopLeft, referView: contentView, size: CGSize.init(width: 50, height: 50), offset: CGPoint(x: 10, y: 10))
        verifiedView.HB_AlignHorizontal(type: HB_AlignType.BottomRight, referView: iconView, size: nil, offset: CGPoint(x: 10, y: 10))
        nameLabel.HB_AlignInner(type: HB_AlignType.TopLeft, referView: contentView, size: nil, offset: CGPoint.init(x: 70, y: 10))
        vipView.HB_AlignHorizontal(type: HB_AlignType.TopRight, referView: nameLabel, size: CGSize(width: 14, height: 14), offset: CGPoint(x: 10, y: 0))
        timeLabel.HB_AlignVertical(type: HB_AlignType.BottomLeft, referView: nameLabel, size: nil, offset: CGPoint.init(x: 0, y: 20))
        sourceLabel.HB_AlignHorizontal(type: HB_AlignType.CenterRight, referView: timeLabel, size: nil, offset: CGPoint(x: 10, y: 0))
        contentLabel.HB_AlignVertical(type: HB_AlignType.BottomLeft, referView: iconView, size: nil, offset: CGPoint(x: 0, y: 10))
        
        let width = UIScreen.main.bounds.width
        footerView.HB_AlignVertical(type: HB_AlignType.BottomLeft, referView: contentLabel, size: CGSize(width: width, height: 44), offset: CGPoint(x: -10, y: 10))
        
        footerView.HB_AlignInner(type: HB_AlignType.BottomRight, referView: contentView, size: CGSize(width: width, height: 44), offset: CGPoint(x: -10, y: -10))
        
    }
    
    //MARK: - 懒加载
    ///头像
    private lazy var iconView: UIImageView = UIImageView.init(image: UIImage.init(named: "avatar_default_big"))
    ///认证图标
    private lazy var verifiedView: UIImageView = UIImageView(image: UIImage(named: "avatar_enterprise_vip"))
    /// 昵称
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    /// 会员图标
    private lazy var vipView: UIImageView = UIImageView(image: UIImage(named: "common_icon_membership"))
    /// 时间
    private lazy var timeLabel: UILabel =
    {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    /// 来源
    private lazy var sourceLabel: UILabel =
    {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    /// 正文
    private lazy var contentLabel: UILabel =
    {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.width - 20
        return label
    }()
    /// 底部工具条
    private lazy var footerView: StatusFooterView = StatusFooterView()
 
}
class StatusFooterView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI() {
        // 1.添加子控件
        addSubview(retweetBtn)
        addSubview(unlikeBtn)
        addSubview(commonBtn)
        
        // 2.布局子控件
        HB_HorizontalTile(views: [retweetBtn, unlikeBtn, commonBtn], insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
    }
    // MARK: - 懒加载
    // 转发
    private lazy var retweetBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "timeline_icon_retweet"), for: .normal)
        btn.setTitle("转发", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn.setBackgroundImage(UIImage(named: "timeline_card_bottom_background"), for: .normal)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return btn
    }()
    
    // 赞
    private lazy var unlikeBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "timeline_icon_unlike"), for: .normal)
        btn.setTitle("赞", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn.setBackgroundImage(UIImage(named: "timeline_card_bottom_background"), for: .normal)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return btn
    }()
    
    // 评论
    private lazy var commonBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "timeline_icon_comment"), for: .normal)
        btn.setTitle("评论", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn.setBackgroundImage(UIImage(named: "timeline_card_bottom_background"), for: .normal)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return btn
    }()
    
}










