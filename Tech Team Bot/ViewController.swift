//
//  ViewController.swift
//  Tech Team Bot
//
//  Created by peppa on 22/07/2019.
//  Copyright © 2019 peppa. All rights reserved.
//
import UIKit
import MessageUI

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, MFMailComposeViewControllerDelegate{
    
    @IBOutlet var table: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
//    @IBAction func numberBtn(_ sender: UIButton) {
//        guard let numberString = sender.titleLabel?.text, let url = URL(string:"telprompt://\(numberString)")
//            else {
//        return
//        }
//
//        UIApplication.shared.open(url)
//
//   }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    enum TableViewDisplayMode {
        case searchedEntries
        case allEntries
    }
    
    var commandArray = [Command]()
    var filteredCommandArray = [Command]() // Used for updating the tableView with searched text
    
    var currentTableViewDisplayMode: TableViewDisplayMode = .allEntries
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpCommands()
        setUpSearchBar()
    }
    
    private func setUpCommands() {
        commandArray.append(Command(name: "AA", number: "12345678901", email: "No Email"))
        commandArray.append(Command(name: "Accessibility", number: "12345678901", email: "info@test.com"))
        commandArray.append(Command(name: "Ace Email", number: "12345678901", email: "info@test.com"))
        commandArray.append(Command(name: "Ace Fbire", number: "12345678901", email: "ad"))
        commandArray.append(Command(name: "ARU", number: "12345678901", email: "No Email"))
        commandArray.append(Command(name: "Aviva", number: "12345678901", email: "info@test.com"))
        commandArray.append(Command(name: "Avoidables", number: "12345678901", email: "ad"))
        commandArray.append(Command(name: "Bonus Passowrds", number: "12345678901", email: "No Email"))
        commandArray.append(Command(name: "Criticals", number: "12345678901", email: "info@test.com"))
        commandArray.append(Command(name: "CRT", number: "12345678901", email: "No Email"))
        commandArray.append(Command(name: "Fleet", number: "12345678901", email: "info@test.com"))
        commandArray.append(Command(name: "I.T", number: "12345678901", email: "info@test.com"))
        
        filteredCommandArray = commandArray
    }
    
    private func setUpSearchBar() {
        searchBar.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentTableViewDisplayMode == .allEntries ? commandArray.count : filteredCommandArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableCell else {
            return UITableViewCell()
        }
        
        switch currentTableViewDisplayMode {
        case .allEntries:
            cell.nameLbl.text = commandArray[indexPath.row].name
            cell.numberLbl.text = commandArray[indexPath.row].number
            cell.emailLbl.text = commandArray[indexPath.row].email
//            cell.phoneCall.titleLabel?.text = commandArray[indexPath.row].number
        case .searchedEntries:
            cell.nameLbl.text = filteredCommandArray[indexPath.row].name
            cell.numberLbl.text = filteredCommandArray[indexPath.row].number
            cell.emailLbl.text = filteredCommandArray[indexPath.row].email
//            cell.phoneCall.titleLabel?.text = commandArray[indexPath.row].number
        }
        return cell
    }
    
    //function for when the search bar is clicked and it searches the data
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if searchBar.text!.isEmpty {
            currentTableViewDisplayMode = .allEntries
            table.reloadData()
            return
        }
        
        filteredCommandArray = commandArray.filter({ command -> Bool in
            switch searchBar.selectedScopeButtonIndex {
                // search through names
            case 0:
                if searchBar.text!.isEmpty { return false }
                return command.name.lowercased().contains(searchBar.text!.lowercased())
                // search through numbers
            case 1:
                if searchBar.text!.isEmpty {return false }
                return command.number.lowercased().contains(searchBar.text!.lowercased())
                // search through emails
            case 2:
                if searchBar.text!.isEmpty { return false }
                return command.email.lowercased().contains(searchBar.text!.lowercased())
                // when nothing entered will return full list
            default:
                return false
            }
        })
        
        currentTableViewDisplayMode = .searchedEntries
        searchBar.resignFirstResponder()
        table.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        currentTableViewDisplayMode = .allEntries
        table.reloadData()
    }
}
class Command {
    let name: String
    let number: String
    let email: String
    
    init(name: String, number: String, email: String) {
        self.name = name
        self.number = number
        self.email = email
    }
    
}
