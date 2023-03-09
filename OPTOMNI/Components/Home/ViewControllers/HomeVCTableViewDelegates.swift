//
//  HomeVCTableViewDelegates.swift
//  OPTOMNI
//
//  Created by Kareem Elfadaly on 10/08/2022.
//

import UIKit

extension HomeVC: UITableViewDelegate , UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return dataSource?.favouriteFruits.count ?? 0
        } else {
            return dataSource?.promotedProducts.count ?? 0
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Favourite Fruits"
        } else {
            return "Promoted Products"
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCell(withIdentifier: "homeTableViewCell", for: indexPath) as! homeTableViewCell
        homeCell.setDataToView(data: (dataSource?.favouriteFruits[indexPath.row])!)
        return homeCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
