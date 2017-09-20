//
//  BusinessCell.swift
//  Yelp
//
//  Created by Ali Mir on 9/19/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {
    
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var listingImageView: UIImageView!
    @IBOutlet var ratingImageView: UIImageView!
    @IBOutlet var reviewsLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var categoriesLabel: UILabel!
    
    var business: Business! {
        didSet {
            self.distanceLabel.text = business.distance
            self.nameLabel.text = business.name
            self.reviewsLabel.text = "\(business.reviewCount ?? 0) reviews"
            self.addressLabel.text = business.address
            self.categoriesLabel.text = business.categories
            
            if let businessImageURL = business.imageURL {
                self.listingImageView.setImageWith(businessImageURL, placeholderImage: #imageLiteral(resourceName: "yelpIcon"))
            } else {
                self.listingImageView.image = #imageLiteral(resourceName: "yelpIcon")
            }
            if let ratingImageURL = business.ratingImageURL {
                // FIXME: - Placeholder for rating...?
                self.ratingImageView.setImageWith(ratingImageURL)
            }
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.listingImageView.layer.cornerRadius = 3.5
        self.listingImageView.clipsToBounds = true
    }

}