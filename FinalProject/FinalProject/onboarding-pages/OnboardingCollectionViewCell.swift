//
//  OnboardingCollectionViewCell.swift
//  FinalProject
//
//  Created by Ceren Güneş on 23.02.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet var slideTitleLabel: UILabel!
    @IBOutlet var slideImageView: UIImageView!
    @IBOutlet var slideDescriptionLabel: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
