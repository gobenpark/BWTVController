//
//  ViewController.swift
//  BWTVController
//
//  Created by qkrqjadn on 03/12/2017.
//  Copyright (c) 2017 qkrqjadn. All rights reserved.
//

import UIKit

import BWTVController


let cellid = "cellid"

class ViewController: BWTVController {
    
    
    let cellid = "cellid"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerViews = [BWTVHeaderView]()
        
        for _ in 1..<5{
            let headerview = BWTVHeaderView()
            headerview.expandState = .reduce
            headerview.childRows = 2
            self.headerViews?.append(headerview)
        }
        
        self.tableView.register(DemoTableViewCell.self, forCellReuseIdentifier: cellid)
        self.heightForRowAt = 100
        self.heightForHeaderInSection = 50
        self.isTopSectionDisplay = true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController{
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as? DemoTableViewCell
        cell?.textLabel?.text = "Section =\(indexPath.section) Row = \(indexPath.row)"
        return cell ?? UITableViewCell()
    }
}



extension ViewController{
    
}

class DemoTableViewCell: UITableViewCell{
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


