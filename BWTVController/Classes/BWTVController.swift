//Copyright (c) 2017 qkrqjadn <qjadn0914@naver.com>
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.


import UIKit

open class BWTVController: UITableViewController {
    
    
    //MARK: - Delegate & DataSource
    
    open var headerView: BWTVHeaderView?
    open var headerViews: [BWTVHeaderView]?
    
    //MARK: - Property
    
    
    open var heightForRowAt: CGFloat?
    open var heightForHeaderInSection: CGFloat?
    open var tableViewEventType: UITableViewRowAnimation = .fade
    open var isTopSectionDisplay: Bool = true
    
    var delegate: BWTVControllerDelegate?
    var dataSource: BWTVControllerDataSource?
    
    
    //MARK: - Init
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        print(isTopSectionDisplay)
    }
    
    
    
    //MARK: - Header Tap Action
    open func tapCellAction(_ sender: UITapGestureRecognizer){
        if let tapHeaderView = sender.view as? BWTVHeaderView{
            switch tapHeaderView.expandState {
            case .reduce:
                tapHeaderView.expandState = expandType.expand
            case .expand:
                tapHeaderView.expandState = expandType.reduce
            default:
                break
            }
            self.tableView.reloadSections(IndexSet(integer: tapHeaderView.tag),
                                          with: tableViewEventType)
        }
    }
}



//MARK: - TableViewDelegate

extension BWTVController {
    open override func numberOfSections(in tableView: UITableView) -> Int {
        return headerViews?.count ?? 0
    }
    
    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let expandStateCheck: expandType = headerViews?[section].expandState ?? .reduce
        return expandStateCheck == .reduce ? 0 : headerViews?[section].childRows ?? 0
    }
    
    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.delegate?.tableView(tableView, cellForRowAt: indexPath) ?? UITableViewCell()
    }
    
    override open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = headerViews?[section]
        headerView?.tag = section
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapCellAction(_:)))
        headerView?.isUserInteractionEnabled = true
        headerView?.addGestureRecognizer(tap)
        return headerView
    }
}

//MARK: - TableViewDataSource

extension BWTVController{
    override open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.dataSource == nil {
            return self.heightForRowAt ?? 0
        }
        return dataSource?.tableView(tableView, heightForRowAt: indexPath) ?? 0
    }
    
    override open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if self.dataSource == nil {
            if isTopSectionDisplay == false && section == 0 {
                return 0
            } else {
                return self.heightForHeaderInSection ?? 0
            }
        }
        return dataSource?.tableView(tableView, heightForHeaderInSection: section) ?? 0
    }
    
    
}

