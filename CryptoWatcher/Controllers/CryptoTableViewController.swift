import UIKit

final class CryptoTableViewController: UITableViewController {
    // MARK: - Properties

    private var coins: [CoinClientModel] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    // MARK: Private

    // MARK: - LIfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSetups()
        fetchDataCurrencyByUsd()
    }

    private func fetchDataCurrencyByUsd() {
        APIManager.instance.getAllExnchanges(completion: { coins in
            self.coins = coins
        })
    }

    // MARK: - Setups

    // MARK: Private

    private func addSetups() {
        addTableViewSetups()
        addNavigationSetups()
    }

    private func addTableViewSetups() {
        tableView.backgroundColor = UIColor(red: 20/255, green: 18/255, blue: 28/255, alpha: 1.0)
        tableView.register(CryptoInfoTableViewCell.self, forCellReuseIdentifier: CryptoInfoTableViewCell.identifier)
        tableView.separatorStyle = .none
    }

    private func addNavigationSetups() {
        title = "Exchanges Rates"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        85
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CryptoInfoTableViewCell.identifier, for: indexPath) as? CryptoInfoTableViewCell {
            cell.set(coins[indexPath.row].assetId!, String(format: "%.3f", coins[indexPath.row].priceUsd ?? ""))
            return cell
        }
        return UITableViewCell()
    }
}