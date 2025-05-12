//
//  customViews.swift
//  colllectionView
//
//  Created by 홍기정 on 5/13/25.
//

import Foundation
import SnapKit

// custom cell
class MyCell: UICollectionViewCell {
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(label)
        label.snp.makeConstraints {$0.edges.equalToSuperview() }
        label.textAlignment = .center
        label.textColor = .white
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// custom header,footer
class MyHeaderView: UICollectionReusableView {
    let label = UILabel()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        addSubview(label)
        label.snp.makeConstraints { $0.edges.equalToSuperview().inset(8) }
        label.textColor = .white
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
