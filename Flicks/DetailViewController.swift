//
//  DetailViewController.swift
//  MovieApp
//
//  Created by Aurielle on 1/25/16.
//  Copyright © 2016 Aurielle. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var infoView: UIView!
    
    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let title = movie["title"] as! String
        let overview = movie["overview"]as! String
        
        titleLabel.text = title
        overviewLabel.text = overview
        
        overviewLabel.sizeToFit()
        
        infoView.frame.size.height = 50 + overviewLabel.frame.size.height

        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: infoView.frame.origin.y + infoView.frame.size.height + 50)
        
        let posterBaseUrl = "http://image.tmdb.org/t/p/w500";
        if let posterPath = movie["poster_path"] as? String{
            let posterUrl = NSURL(string: posterBaseUrl + posterPath);
            posterImageView.setImageWithURL(posterUrl!);
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
