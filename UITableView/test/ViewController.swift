//
//  ViewController.swift
//  test
//
//  Created by 홍기정 on 5/10/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate {
    // tableView
    var tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    // header, footer
    let header = ["h1", "h2", "h3"]
    let footer = ["f1", "f2", "f3"]
    
    // data list
    lazy var data: [[String]] = [sect1cells, sect2cells, sect3cells]
    let sect1cells = (1...7).map { "Item : 1-\($0)" }
    let sect2cells = (1...7).map { "Item : 2-\($0)" }
    let sect3cells = (1...7).map { "Item : 3-\($0)" }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ $0.edges.equalTo(view.safeAreaLayoutGuide) }
        
        // dataSource 지정
        tableView.dataSource = self
        // cell reuse 등록
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        // header/footer reuse 등록
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "MyHeaderFooter")
        // delegate 지정
        tableView.delegate = self
        
    }
}

extension ViewController: UITableViewDataSource {
    
    // 섹션의 개수 (생략하면 섹션 개수 = 1)
    func numberOfSections(in tableView: UITableView) -> Int {
        return header.count
    }
    // 섹션별 행 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    // 각각의 행
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 재사용하지 않는 cell
        //let cell = UITableViewCell(style: .default, reuseIdentifier: .none)
        
        // reuse cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }
    
    // 섹션의 헤더, 푸터
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)-> String? {
        return header[section]
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return footer[section]
    }

    // action
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.backgroundColor = .red
    }
    // height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    

}
