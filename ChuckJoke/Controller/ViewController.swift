//
//  ViewController.swift
//  ChuckJoke
//
//  Created by Daniel Washington Ignacio on 26/09/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var jokeLabel: UILabel!
    
    var chuckJokeController = ChuckJokeModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func jokeButton(_ sender: UIButton) {
    }
    
    func didUpdateJoke(joke: ChuckJokeModelData) {
        print(joke.value)
    }
}

