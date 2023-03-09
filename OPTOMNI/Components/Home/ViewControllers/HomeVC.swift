//
//  HomeVC.swift
//  OPTOMNI
//
//  Created by Kareem Elfadaly on 10/08/2022.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!

    final var dataSource:HomeResponse?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        customNavBar()
        setupTableView()
        prepareData()
    }

    func customNavBar() {
        self.navigationItem.title = "Home"
    }

    func setupTableView() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(UINib(nibName: "homeTableViewCell", bundle: nil), forCellReuseIdentifier: "homeTableViewCell")
    }

    func prepareData() {
        dataSource = getDataFromAPI(fileName: "homeData")
        if let _ = dataSource {
            homeTableView.reloadData()
        } else {
            fatalError("no data returned")
        }
    }

    func getDataFromAPI(fileName: String) -> HomeResponse? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(HomeResponse.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }


}
