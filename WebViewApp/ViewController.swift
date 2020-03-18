//
//  ViewController.swift
//  WebViewApp
//
//  Created by 503 on 2020/03/18.
//  Copyright © 2020 ssang. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView
/*
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

class ViewController: UIViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    loadData()
    }
    //웹서버에서 json 데이터를 로드하여,
    //동적으로 유튜브썸네일 생성하기!!
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
                
                ///uI제어는 메인 실행부에게 맡겨야 하므로
                DispatchQueue.main.async{
                    self.createThumnail(obj:movies)
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
    

}
*/
