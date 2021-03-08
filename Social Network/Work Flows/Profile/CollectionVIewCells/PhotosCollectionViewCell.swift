//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Arthur Raff on 25.10.2020.
//

import UIKit

@available(iOS 13.0, *)
class PhotosCollectionViewCell: UICollectionViewCell {
    var photo: UserPhoto? {
        didSet {
            guard let photo = photo else { return }
            
            configure(photo)
        }
    }
    private lazy var photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 8
        iv.contentMode = .scaleAspectFill
        
        return iv
    }()
    
    func configure(_ photo: UserPhoto) {
        photoImageView.image = UIImage(named: photo.photo)
    }
    
    private func setupLayout() {
        contentView.addSubview(photoImageView)
        
        photoImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        setupLayout()
    }
}
