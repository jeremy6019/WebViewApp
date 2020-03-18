//
//  ListController.swift
//  WebViewApp
//
//  Created by 503 on 2020/03/18.
//  Copyright © 2020 ssang. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

struct Movies:Decodable{
    var movieList:Array<Movie>!
    
    init(){
        movieList = Array<Movie>()
    }
}

struct Movie:Decodable{
    var id:String!
    var title:String!
    var sub:String!
}

class ListController: UITableViewController {
    
    var movieArray:Array<Movie> = Array<Movie>()
    
    func loadData(){
       //비동기 요청 객체
        let urlSession = URLSession.shared
        
        let url = URL(string: "http://localhost:7777/js/data.js")!
        
        urlSession.dataTask(with: url, completionHandler: {
            (data, response, error) in
            //제이슨을 분석하여 썸네일 생성
            var json = String(data: data!, encoding: String.Encoding.utf8)
            
            print(json!)
            //json을 파싱해서 객체에 보관해 놓자
            let decoder = JSONDecoder()
            //제이슨이 인스턴스에 탑재되어 반환!!
            do{
                var movies = try decoder.decode(Movies.self, from: data!)
                self.movieArray = movies.movieList
                
                ///uI제어는 메인 실행부에게 맡겨야 하므로
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
                
            }catch{
                print(error)
            }
            
            }).resume()
    }
    
    func createThumnail(obj:Movies){
        //없었던 UIView를 생성하여 부착 (UI)
        print("영화의 수는", obj.movieList.count)
        for i in 0..<obj.movieList.count {
            
            var movieView = MovieView(frame: CGRect(x: 20, y: 50+(i*95), width: 120, height: 90))
            
            var id = obj.movieList[i].id!
            movieView.load(withVideoId: id)
            
            //부모뷰에 부착
            self.view.addSubview(movieView)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movieArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        var customCell = CustomCell()
        
        var rect = MovieView(frame: CGRect(x: 10, y: 2, width: 50, height: 40))
        
        var movie = movieArray[indexPath.row]
        
        rect.load(withVideoId: movie.id)
        customCell.textLabel!.text = movie.title!
        customCell.textLabel!.text = movie.sub!
        
        //rect.backgroundColor = UIColor.yellow
        
        customCell.addSubview(rect)
        
        return customCell //내가 정의한 셀 반환 !!
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
