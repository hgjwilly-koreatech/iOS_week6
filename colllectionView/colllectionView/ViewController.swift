//
//  ViewController.swift
//  colllectionView
//
//  Created by 홍기정 on 5/13/25.
//

import UIKit
import SnapKit



class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let data = [["1", "2", "3", "4", "5"],
                ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
                ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14"]]
    let headers = ["header1", "header2", "header3"]

    //
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 8
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .yellow
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // custom cell 등록
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: "MyCell")
        // custom header 등록
        collectionView.register(MyHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MyHeader")
        
        // collectionView를 추가하고, autolayout
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        // header,footer 크기 설정 (안하면 안보인다)
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.headerReferenceSize = CGSize(width: view.frame.width, height: 44)
        }
    }
}

extension ViewController {
    
    // section 개수 반환
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    // item 개수 반환
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].count
    }
    
    // header, footer dataSource 메서드
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MyHeader", for: indexPath) as! MyHeaderView
            header.label.text = headers[indexPath.section]
            return header
        }
        return UICollectionReusableView()

    }
    
    
    
    // item 반환
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? MyCell else { fatalError("convert error") }
        item.backgroundColor = .blue
        item.label.text = data[indexPath.section][indexPath.item]
        return item
    }
    
}

