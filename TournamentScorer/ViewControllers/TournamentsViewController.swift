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
    
    
    fileprivate let tournaments: [Tournament] = [Tournament(withTitle: "Test Tournament 1")]
    
    fileprivate let cellName = String(describing: TournamentCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView!.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
    }
    
}

extension TournamentsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tournaments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName) as! TournamentCell
        cell.update(withTournament: tournaments[indexPath.row])
        return cell
    }
    
}

extension TournamentsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}
