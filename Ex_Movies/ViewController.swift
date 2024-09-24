//
//  ViewController.swift
//  Ex_Movies
//
//  Created by Nguyễn Văn Hiếu on 23/9/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    
    let filmNames = [
        "Bạn Trai Đi Thuê", "Thị Trấn Ác Mộng", "Vua Hải Tặc", "Nữ Vương Phản diện", "Hà Bách Tế",
        "Chó Săn Chiến Tranh", "Anh Trai Vượt Mọi Tam Tai", "Kinh Hãi", "BLUE LOCK THE MOVIE-EPISODE NAGI", "The Crow: Báo Thù"
    ]
    
    let images = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    let categories = ["Action", "Animation"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        collectionView1.register(nib, forCellWithReuseIdentifier: "CustomCell")
        collectionView2.register(nib, forCellWithReuseIdentifier: "CustomCell")
        
        label1.text = categories.first
        label2.text = categories.last
        
        collectionView1.backgroundColor = .clear
        collectionView2.backgroundColor = .clear
    }
    
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView1 {
            return images.count
        }else {
            return images.count - 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCollectionViewCell
        if collectionView == collectionView1 {
            cell.titleLabel.text = filmNames[indexPath.row]
            cell.imageView.image = UIImage(named: images[indexPath.row])
        } else {
            cell.titleLabel.text = filmNames[indexPath.row]
            cell.imageView.image = UIImage(named: images[indexPath.row])
        }
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 230)
    }
}

