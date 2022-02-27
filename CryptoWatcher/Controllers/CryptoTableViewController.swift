import UIKit

final class CryptoTableViewController: UITableViewController {
    
    // MARK: - Properties

    // MARK: Private
    
    private var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    private var searchController: UISearchController = .init()
    private var coins: [CoinClientModel] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    private var searchResults: [CoinClientModel] = []

    // MARK: - LIfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSetups()
        fetchDataCoins()
    }

    // MARK: - API

    private func fetchDataCoins() {
        showActivityIndicator()
        APIManager.instance.getAllExnchanges(completion: { coins in
            self.coins = coins
            self.hideActivityIndicator()
        })
    }

    // MARK: - Setups

    // MARK: Private

    private func addSetups() {
        addTableViewSetups()
        addNavigationSetups()
        addSetupsSerchController()
    }

    private func addTableViewSetups() {
        tableView.backgroundColor = UIColor(red: 20/255, green: 18/255, blue: 28/255, alpha: 1.0)
        tableView.register(CryptoInfoTableViewCell.self, forCellReuseIdentifier: CryptoInfoTableViewCell.identifier)
        tableView.separatorStyle = .none
    }
    
    private func addSetupsSerchController() {
        searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search coins..."
        searchController.searchBar.barTintColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
    }

    private func addNavigationSetups() {
        title = "Exchanges Rates"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Helpers
    
    // MARK: Private
    
    private func showActivityIndicator() {
        view.isUserInteractionEnabled = false
        let viewController = tabBarController ?? navigationController ?? self
        activityIndicator.frame = CGRect(x: 0,
                                         y: 0,
                                         width: viewController.view.frame.width,
                                         height: viewController.view.frame.height)
        viewController.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    private func hideActivityIndicator() {
        view.isUserInteractionEnabled = true
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return searchResults.count
        } else {
            return coins.count
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CryptoInfoTableViewCell.identifier, for: indexPath) as? CryptoInfoTableViewCell {
            let coin = (searchController.isActive) ? searchResults[indexPath.row] : coins[indexPath.row]
            cell.set(coin.assetId ?? "None", String(format: "%.3f", coin.priceUsd ?? "0"))
            return cell
        }
        return UITableViewCell()
    }
}

extension CryptoTableViewController: UISearchResultsUpdating {
    func filterContent(for SearchText: String) {
        searchResults = coins.filter { coins -> Bool in
            if let name = coins.assetId?.lowercased() {
                return name.hasPrefix(SearchText.lowercased())
            }
            return false
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            tableView.reloadData()
        }
    }
    
    
}
