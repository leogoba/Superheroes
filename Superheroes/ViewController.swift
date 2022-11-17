//
//  ViewController.swift
//  Superheroes
//
//  Created by leogoba on 17.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var superheroes: [Superhero] = []

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetch()
    }

    private func fetch() {
        NetworkManager.shared.fetch(from: Link.apiLink.rawValue) { [weak self] result in
            switch result {
            case .success(let superheroes):
                self?.superheroes = superheroes
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let qwe = segue.destination as? TabBarViewController else { return }
        qwe.superheroes = superheroes
    }
}

