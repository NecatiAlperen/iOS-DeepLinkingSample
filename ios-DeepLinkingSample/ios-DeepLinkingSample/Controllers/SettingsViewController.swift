//
//  SettingsViewController.swift
//  ios-DeepLinkingSample
//
//  Created by Necati Alperen IŞIK on 1.08.2024.
//

import UIKit

struct Settings {
    let title: String
    let iconName: String
}

class SettingsViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.identifier)
        return tableView
    }()

    private var settings: [[Settings]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        configureSettings()
    }

    private func configureSettings() {
        settings = [
            [
                Settings(title: "General", iconName: "gear"),
                Settings(title: "Wi-Fi", iconName: "wifi"),
                Settings(title: "Airplane Mode", iconName: "airplane")
            ],
            [
                Settings(title: "Notifications", iconName: "bell"),
                Settings(title: "Privacy", iconName: "hand.raised.fill")
            ]
        ]
        tableView.reloadData()
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.identifier, for: indexPath) as! SettingsCell
        let setting = settings[indexPath.section][indexPath.row]
        cell.configure(with: setting)
        return cell
    }

    
}
