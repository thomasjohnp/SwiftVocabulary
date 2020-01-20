//
//  WordsTableViewController.swift
//  Swift Vocabulary
//
//  Created by John Thomas on 1/19/20.
//  Copyright © 2020 John Thomas. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {

    var vocabWords: [VocabularyWord] = [VocabularyWord(word: "blah1", definition: "blah2"),
                                        VocabularyWord(word: "blah3", definition: "blah4")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vocabWords.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)
    
        // Configure the cell...
        let word = vocabWords[indexPath.row]
        cell.textLabel?.text = word.word
        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

        if segue.identifier == "ShowDefinitionSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let definitionVC = segue.destination as? DefinitionViewController {

                definitionVC.vocabWord = vocabWords[indexPath.row]
                
            }
        }

    }
}
