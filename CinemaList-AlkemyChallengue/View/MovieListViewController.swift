//
//  MovieListViewController.swift
//  CinemaList-AlkemyChallengue
//
//  Created by Ivan Romero on 01/04/2022.
//

import UIKit
import Alamofire
import AlamofireImage

class MovieListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var movies: [MovieResults] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
        getData()
    }
    
    func getData (){
        
        APIConection.shared.getMovies { movie in
            self.movies = movie.results
            self.tableView.reloadData()
        } failure: { error in
            print(error.debugDescription)
        }
    }
}

extension MovieListViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.titleLabel.text = self.movies[indexPath.row].original_title
        cell.subTitlelabel.text = self.movies[indexPath.row].release_date
        
        AF.request("https://image.tmdb.org/t/p/w500\(self.movies[indexPath.row].backdrop_path)").responseImage { response in
            
           if let image = response.value {
               cell.imageMovie.image = image
           } else {
               print(response.error.debugDescription)
           }
        }
        
        return cell
        
    }

}
