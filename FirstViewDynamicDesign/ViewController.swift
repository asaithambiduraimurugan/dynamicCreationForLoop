//
//  ViewController.swift
//  FirstViewDynamicDesign
//
//  Created by asaithambi duraimurugan on 25/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    let screenWidth = UIScreen.main.bounds.width
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .lightGray
        return scrollView
    }()
    
    let stackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .center
        stackview.spacing = 10
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    //as
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollviewSetUp()
        createImageView()
    }
    
    func scrollviewSetUp() {
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
        
        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.widthAnchor.constraint(equalToConstant: screenWidth)
            
            
        ])
        
       
    }
    
    
    func createImageView() {
        let numberofColumn = 3
        let numberofRows = 10
        let imageViewSize = CGSize(width: 100, height: 220)
        let spacing: CGFloat = 20
        
        
        var xOffset: CGFloat = 30
        var yOffset: CGFloat = 30
        
        
        for row in 0..<numberofRows {
            for column in 0..<numberofColumn {
                let imageView = UIImageView(frame: CGRect(x: xOffset, y: yOffset, width: imageViewSize.width, height: imageViewSize.height))
                imageView.backgroundColor = UIColor.lightGray
                imageView.contentMode = .scaleAspectFill
                imageView.image = UIImage(named: "image")
                imageView.layer.cornerRadius = 10
                imageView.layer.borderWidth = 1
                imageView.layer.borderColor = UIColor.black.cgColor
                imageView.clipsToBounds = true
                
                
                stackView.addSubview(imageView)
              
                xOffset += imageViewSize.width + spacing // update Xoffset image view
            }
            
            xOffset = 30  // Reset next update to the row
            
            yOffset += imageViewSize.height + spacing // update yOffset imageview
        }
    
    }
}

