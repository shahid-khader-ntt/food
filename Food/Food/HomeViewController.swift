//
//  HomeViewController.swift
//  Food
//
//  Created by Shahid on 01/04/25.
//

import UIKit

enum Foods: String, CaseIterable {
    case biryani
    case burger
    case masalaDosa

    var name: String {
        switch self {
        case .biryani, .burger:
            return self.rawValue.capitalized
        case .masalaDosa:
            return "Masala Dosa"
        }
    }

    var imageName: String {
        return self.rawValue
    }

    var price: Int {
        switch self {
        case .biryani: return 80
        case .burger: return 50
        case .masalaDosa: return 60
        }
    }
}


class HomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    var searchedFood: [Foods] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let user = UserDefaultsManager.shared.getUser()
        // Do any additional setup after loading the view.
        let name = user.email?.getCapitalizedNameFromEmail() ?? "User"
        titleLabel.text = "Hello \(name)"
        
        tableView.showsVerticalScrollIndicator = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "FoodsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FoodsTableViewCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        searchedFood = Foods.allCases
        tableView.reloadData()
    }
    

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchedFood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodsTableViewCell", for: indexPath) as! FoodsTableViewCell
        cell.setupCell(food: searchedFood[indexPath.row])
        return cell
    }
    
}
