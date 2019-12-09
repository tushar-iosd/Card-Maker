//
//  CardTextTemplateVC.swift
//  CardMaker
//
//  Created by Tushar Sharma on 06/12/19.
//  Copyright © 2019 Appecules. All rights reserved.
//

import UIKit

class CardTextTemplateVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var templateTable: UITableView!
    
    let template = ["Christmas is a time for nostalgia, but it is also a time for making new memories. Enjoy the fellowship of new friends, and cherish the company of family in this season of loving and sharing. Merry Christmas!","There is nothing more magical than decorated trees, lights, presents, family and friends to brighten up your life. Merry Christmas!","Christmas is the perfect season to reach out to others when laughter and good tidings are in the air. Here’s hoping that your Christmas will find you among family and friends, sharing the spirit of the season.","On this joyous day, and throughout the new year, may your life be filled with an abundance of love.",
                    "Merry Christmas and may you live a long and happy life filled with goodwill and friendship.","Give and receive love this holiday season and you will surely have a joyous Xmas. Best wishes to your family this season and always. May Christmas spread cheer in your lives!","6","7","8","9","10"]
    
    var selectedTemplate: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        templateTable.delegate = self
        templateTable.dataSource = self
        templateTable.rowHeight = UITableView.automaticDimension
        templateTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func okayAction(_ sender: Any) {
        CardDetailVC.templateText = selectedTemplate
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = template[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTemplate = template[indexPath.row]
    }
}


