//
//  SearchListViewController.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class SearchListViewController: UIViewController {
    private var buildings: [BuildingResult] = []
    
    
    
    fileprivate static let commentCellId = "commentCell"
    
    var presenter: SearchListPresenterProtocol!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.register(UINib(nibName: CommentCell.nibName, bundle: nil),
                           forCellReuseIdentifier: SearchListViewController.commentCellId)
    }
    @IBAction func getIt(_ sender: Any) {
        getBuildings(count: 20) { [weak self] buildings in
            guard let strongSelf = self else {
                return
            }
            strongSelf.buildings = buildings
            strongSelf.reloadTable()
        }
    }

    // MARK: - Private

    private func getBuildings(count: Int, onComplete: @escaping ([BuildingResult]) -> Void) {
        
        guard let url = URL(string: "http://api.trend-dev.ru/v3_1/blocks/search?show_type=list&count=\(count)&offset=1")
            else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    onComplete([])
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    onComplete([])
                }
                return
            }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchDataResult.self, from: data)
                DispatchQueue.main.async {
                    onComplete(searchResult.data.buildings)
                }
            } catch {
                DispatchQueue.main.async {
                    onComplete([])
                }
            }
            }.resume()
    }

    private func reloadTable() {
        tableView.reloadData()
    }
    
}

extension SearchListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buildings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchListViewController.commentCellId,
                                                 for: indexPath)
        
        guard let commentCell = cell as? CommentCell else {
            return UITableViewCell(frame: .zero)
        }
        let building = buildings[indexPath.row]
        commentCell.setRegionName(building.region.name)
        
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
