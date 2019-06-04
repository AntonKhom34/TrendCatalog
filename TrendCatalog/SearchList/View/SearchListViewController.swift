//
//  SearchListViewController.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class SearchListViewController: UIViewController {
    fileprivate static let commentCellId = "commentCell"
    
    var presenter: SearchListPresenterProtocol!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.register(UINib(nibName: CommentCell.nibName, bundle: nil),
                           forCellReuseIdentifier: SearchListViewController.commentCellId)
    }

}

extension SearchListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchListViewController.commentCellId,
                                                 for: indexPath)
        
        guard let commentCell = cell as? CommentCell else {
            return UITableViewCell(frame: .zero)
        }
        
//        guard let commentItem = presenter?.getCommentItem(atIndex: indexPath.item) else {
//            return UITableViewCell(frame: .zero)
//        }
//        
//        commentCell.commentText = commentItem.textAttributedString
//        commentCell.author = commentItem.author
//        commentCell.dateString = commentItem.getFormattedDateString()
        
        
        
        return cell
    }
    
}

extension SearchListViewController: SearchListViewProtocol {
}
