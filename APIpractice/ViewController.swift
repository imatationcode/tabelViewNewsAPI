//
//  ViewController.swift
//  APIpractice
//
//  Created by Shivakumar Harijan on 28/03/24.
//
import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    var articlesList = [articalDataStruct]()
    
    // URL of the API endpoint
    let urlString = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=ab2cbfe3a4e14cd387fa4572be4c25f6"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromAPI()
    }
    
    func fetchDataFromAPI() {
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                // Handle the error here (e.g., print error message)
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                // Handle no data case (optional)
                return
            }
            var newsFullList: NewsDataStruct?
            do {
                //decoding JSON data into structure
                newsFullList = try JSONDecoder().decode(NewsDataStruct.self, from: data)
                
            }
            catch {
                print("Error while Decoding JSON into Swift Structure\(error)")
                
            }
            self.articlesList = newsFullList!.articles
            DispatchQueue.main.async {
                self.myTableView.reloadData()
                
            }
        }
        task.resume()
    }
}

//extension UIImage {
//    static func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
//        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                print(error.localizedDescription)
//                completion(nil)
//                return
//            }
//            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200 else {
//                print("The image URL is not in HTTP")
//                completion(nil)
//                return
//            }
//            guard let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, let image = UIImage(data: data) else {
//                print("Error while fetching image")
//                completion(nil)
//                return
//            }
//            DispatchQueue.main.async {
//                completion(image)
//            }
//        }
//        dataTask.resume()
//    }
//}

extension UIImageView
{
    func downloadImage(from url:URL){
        //contentMode = .scaleToFill
        let dataTask = URLSession.shared.dataTask(with: url){(data,response,error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let httpURLres = response as? HTTPURLResponse, httpURLres.statusCode == 200 else {
                print("The Image URL is not IN HTTP")
                return
            }
            guard  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
            let data = data, error == nil,
            let image = UIImage(data: data) else {
                print("Error while fetching image")
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }

        }
        dataTask.resume()
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTTableViewCell
        if articlesList[indexPath.row].author != nil {
            cell.newsAuthLable.text = "Author: \(articlesList[indexPath.row].author!)"
        } else {
            cell.newsAuthLable.text = "NO Author"
        }
        cell.newsHeadingLabel.text = articlesList[indexPath.row].title
        if articlesList[indexPath.row].urlToImage != nil {
            let url = URL(string: articlesList[indexPath.row].urlToImage!)
            cell.newsImageView.downloadImage(from: url!)
            
        } else {
            cell.newsImageView.image = UIImage(named: "SoftmonksLogo")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewsDetailView") as? DetailedNewsViewController
        vc?.newsContent = articlesList[indexPath.row]
        navigationController?.pushViewController(vc!, animated: true)
        
//        if let forgotPassword = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordViewController") as? ForgotPasswordViewController {navigationController?.pushViewController(forgotPassword, animated: true)}
    }

    
}

//    // Define a struct to represent the expected JSON data structure
//    struct NewsData: Decodable, Encodable{
//        let status: String
//        let totalResults: Int
//        let articles: [Article]
//        struct Article: Decodable, Encodable {
//            let source: NewsSource
//            let author: String?
//            let title: String
//            let description: String?
//            let url: String
//            let urlToImage: String?
//            let publishedAt: String
//            
//            struct NewsSource: Decodable, Encodable {
//                let id: String?
//                let name: String
//            }
//        }
//    }
