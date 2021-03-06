//
//  PhotoCollectionViewCell.swift
//  Photo-Album-App_Swift
//
//  Created by 조중윤 on 2022/02/16.
//

import UIKit
import Photos

final class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbnailView: UIImageView!
    
    static var identifier: String {
            return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    public func setThumbnailSize(with size: CGSize) {
        self.thumbnailView.bounds.size = size
    }
    
    public func updateThumbnail(with asset: PHAsset?, completionHandler: ((Bool) -> Void)?) {
        
        self.thumbnailView.fetchImageAsset(
            with: asset, size: self.thumbnailView.bounds.size,
            contentMode: .aspectFill, options: nil) { success in
                completionHandler?(success)
            }
    }

}
