//
//  TournamentsViewController.swift
//  TournamentScorer
//
//  Created by Jade Chloe on 18/03/2017.
//  Copyright © 2017 Mike. All rights reserved.
//

import UIKit

class TournamentsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    var addFooter: AddFooterView?
    
    fileprivate var tournaments: [Tournament] = UserDefaults.tournaments
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addFooter = AddFooterView.viewFromNib() as? AddFooterView
        addFooter?.delegate = self
        
        tableView?.registerCell(ofType: TournamentCell.self)
        
        UserDefaults.tournaments = []
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tournaments = UserDefaults.tournaments
        tableView?.reloadData()
    }
    
}

extension TournamentsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tournaments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(ofType: TournamentCell.self) as! TournamentCell
        cell.update(withTournament: tournaments[indexPath.row])
        return cell
    }
    
}

extension TournamentsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.navigationController?.presentMasterViewController(withTournament: tournaments[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if let footer = self.tableView(tableView, viewForFooterInSection: section) {
            footer.layoutIfNeeded()
            return footer.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return addFooter
    }
}

extension TournamentsViewController: AddFooterViewDelegate {
    
    func footerTapped(footer: AddFooterView) {
        self.navigationController?.pushViewController(EditTournamentViewController(), animated: true)
    }
    
}
