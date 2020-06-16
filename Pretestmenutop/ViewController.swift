//
//  ViewController.swift
//  Pretestmenutop
//
//  Created by Peem on 14/6/2563 BE.
//  Copyright © 2563 Pretestmenutop. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{

    @IBOutlet var table: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    var animalArray = [Food]()
    var currentAnimalArray = [Food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpAnimals()
        setUpSearchBar()
        alterLayout()
    }

    private func setUpAnimals() {
        
        animalArray.append(Food(name: "ข้าวผัดอบกุนเชียง",          price: .dog, image:"1"))
            animalArray.append(Food(name: "ก๋วยเตี๋ยวต้มยำ", price: .noodle, image:"2"))
        animalArray.append(Food(name: "ก๋วยเตี๋ยวเรือ", price: .noodle, image:"3"))
            animalArray.append(Food(name: "แกงเขียวหวานหมู", price: .cat, image:"4"))
            animalArray.append(Food(name: "แกงคั่วหมูเทโพ", price: .cat, image:"5"))
            animalArray.append(Food(name: "แกงจืดตำลึงเต้าหู้หมูสับ", price: .cat, image:"6"))
            animalArray.append(Food(name: "แกงจืดสัปปะรด", price: .cat, image:"7"))
            animalArray.append(Food(name: "ข้าวผัดหมูลิ้นจี่", price: .dog, image:"8"))
            animalArray.append(Food(name: "ซี่โครงหมูหวาน", price: .dog, image:"9"))
            animalArray.append(Food(name: "ต้มยำขาหมู", price: .dog, image:"10"))
            animalArray.append(Food(name: "ตับหวาน", price: .dog, image:"11"))
            
            currentAnimalArray = animalArray
        }
        
        private func setUpSearchBar() {
            searchBar.delegate = self
        }
        
        func alterLayout() {
            table.tableHeaderView = UIView()
            table.estimatedSectionHeaderHeight = 50
            navigationItem.titleView = searchBar
            searchBar.showsScopeBar = true
            searchBar.placeholder = "Search Food Name"
        }
            
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return currentAnimalArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableCell else {
                return UITableViewCell()
            }
            cell.nameLbl.text = currentAnimalArray[indexPath.row].name
            cell.categoryLbl.text = currentAnimalArray[indexPath.row].price.rawValue
            cell.imgView.image = UIImage(named:currentAnimalArray[indexPath.row].image)
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            return 100
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            currentAnimalArray = animalArray.filter({ animal -> Bool in
                switch searchBar.selectedScopeButtonIndex {
                case 0:
                    if searchText.isEmpty { return true }
                    return animal.name.lowercased().contains(searchText.lowercased())
                case 1:
                    if searchText.isEmpty { return animal.price == .dog }
                    return animal.name.lowercased().contains(searchText.lowercased()) &&
                    animal.price == .dog
                case 2:
                    if searchText.isEmpty { return animal.price == .cat }
                    return animal.name.lowercased().contains(searchText.lowercased()) &&
                    animal.price == .cat
                default:
                    return false
                }
            })
            table.reloadData()
        }
        
        func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
            switch selectedScope {
            case 0:
                currentAnimalArray = animalArray
            case 1:
                currentAnimalArray = animalArray.filter({ animal -> Bool in
                    animal.price == AnimalType.dog
                })
            case 2:
                currentAnimalArray = animalArray.filter({ animal -> Bool in
                    animal.price == AnimalType.cat
                })
            default:
                break
            }
            table.reloadData()
        }
    }

    class Food {
        let name: String
        let image: String
        let price: AnimalType
        
        init(name: String, price: AnimalType, image: String) {
            self.name = name
            self.price = price
            self.image = image
        }
    }

    enum AnimalType: String {
        case cat = "35"
        case dog = "30"
        case noodle = "45"
    }


