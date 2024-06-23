//
//  ViewController.swift
//  Evia
//
//  Created by Furkan on 4.12.2023.
//

import UIKit

class HomeViewController: UIViewController {

    private let datas: [String] = ["Arriving Home", "Leaving", "Night Time", "Leaving", "Arrive Home", "Night Time"]
    
   private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Home"
       label.font = .font(.interRegular, size: .large)
       label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(asset: Asset.Icons.down)
        return image
    }()
    
    private let settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Icons.settings), for: .normal)
        return button
    }()
    
   private let titleStackView: UIStackView = {
       let stackview = UIStackView()
       stackview.axis = .horizontal
       stackview.alignment = .center
        return stackview
    }()
    
    private let topStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.distribution = .equalSpacing
         return stackview
     }()
    
    private let weatherView = WeatherView()
    
    private let quickActionLabel: UILabel = {
        let label = UILabel()
        label.text = "Quick action"
        label.font = .font(.interMedium, size: .h4)
        return label
     }()
     
     private let bookmarkIcon: UIImageView = {
         let image = UIImageView()
         image.image = UIImage(asset: Asset.Icons.bookmark)
         return image
     }()
     
     private let editButton: UIButton = {
         let button = UIButton()
         button.setTitle("Edit", for: .normal)
         button.setTitleColor(.appEdit, for: .normal)
         button.titleLabel?.font = .font(.interMedium, size: .h6)
         return button
     }()
     
    private let quickActionStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.spacing = 2.5
        stackview.alignment = .center
         return stackview
     }()
     
     private let actionStackView: UIStackView = {
         let stackview = UIStackView()
         stackview.axis = .horizontal
         stackview.distribution = .equalSpacing
          return stackview
      }()
    
    private let mainStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.spacing = 30
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let actionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 10, height: 0)
        //layout.sectionInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50) // Sola ve Sağa boşluk
        //layout.minimumLineSpacing = 45
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
         collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ActionsCollectionViewCell.self, forCellWithReuseIdentifier: ActionsCollectionViewCell.identifier)
         return collectionView
    }()
    
    private let devicesLabel: UILabel = {
        let label = UILabel()
        label.text = "Devices"
        label.font = .font(.interMedium, size: .h4)
        return label
    }()
    
    private let devicesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 160, height: 110)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        layout.minimumLineSpacing = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DevicesCollectionViewCell.self, forCellWithReuseIdentifier: DevicesCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        applyConstraints()
        //actionCollectionView.reloadData()
        view.backgroundColor = .systemBackground
        
        actionCollectionView.dataSource = self
        actionCollectionView.delegate = self
        
        devicesCollectionView.delegate = self
        devicesCollectionView.dataSource = self
        
        updateWeatherView(city: "Zagreb, Croatia", temperature: "15°C")
        
    }
}

// MARK: - Layout
extension HomeViewController {
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(topStackView)
        mainStackView.addArrangedSubview(weatherView)
        mainStackView.addArrangedSubview(actionStackView)
        mainStackView.addArrangedSubview(actionCollectionView)
        mainStackView.addArrangedSubview(devicesLabel)
        mainStackView.addArrangedSubview(devicesCollectionView)
        topStackView.addArrangedSubview(titleStackView)
        topStackView.addArrangedSubview(settingsButton)
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(titleIcon)
        actionStackView.addArrangedSubview(quickActionStackView)
        actionStackView.addArrangedSubview(editButton)
        quickActionStackView.addArrangedSubview(bookmarkIcon)
        quickActionStackView.addArrangedSubview(quickActionLabel)
    }
    
    private func applyConstraints() {
        
        let weatherViewConstraints = [
            weatherView.heightAnchor.constraint(equalToConstant: 164)
        ]
        let mainStackViewConstraints = [
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40)
        ]
        
        let collectionViewConstraints = [
            actionCollectionView.topAnchor.constraint(equalTo: quickActionStackView.bottomAnchor, constant: 15),
           // collectionView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            actionCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            actionCollectionView.heightAnchor.constraint(equalToConstant: 48)
        ]
        
        let devicesCollectionViewConstraints = [
            //devicesCollectionView.topAnchor.constraint(equalTo: devicesLabel.bottomAnchor),
            //devicesCollectionView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            //devicesCollectionView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            devicesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ]
        
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        let allConstraints = [
            weatherViewConstraints,
            mainStackViewConstraints,
            collectionViewConstraints,
            devicesCollectionViewConstraints,
            scrollViewConstraints
        ]
        NSLayoutConstraint.activate(allConstraints.flatMap { $0 })
    }
}

// MARK: - Actions CollectionView

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      if collectionView == actionCollectionView {
          return datas.count + 1
      } else if collectionView == devicesCollectionView {
          return 10
      }
      return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellColors: [UIColor] = {
            let colors: [UIColor] = [.appYellow, .appPurple, .appGreen]
            return Array(repeating: colors, count: (datas.count / colors.count) + 1).flatMap { $0 }
        }()

        if collectionView == actionCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActionsCollectionViewCell.identifier, for: indexPath) as? ActionsCollectionViewCell
            if indexPath.row == 0 {
                cell?.actionsButton.setImage(UIImage(asset: Asset.Icons.plus), for: .normal)
                cell?.actionsButton.backgroundColor = .appDarkGreen
                cell?.actionsButton.setTitle("", for: .normal)
                return cell!
            }else {
                
                cell?.actionsButton.setTitle(datas[indexPath.row - 1], for: .normal)
                cell?.actionsButton.backgroundColor = cellColors[indexPath.row]
                return cell!
            }
            
        } else if collectionView == devicesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DevicesCollectionViewCell.identifier, for: indexPath) as? DevicesCollectionViewCell
            cell?.contentView.backgroundColor = .appWeather
            return cell!
        }
        return UICollectionViewCell()
    }
    
}

// MARK: - Weather
extension HomeViewController {
    private func updateWeatherView(city: String, temperature: String) {
            // WeatherView'in içeriğini güncelleyin
            weatherView.cityLabel.text = city
            weatherView.temperatureLabel.text = temperature
            // İkonları güncellemek için gerekirse:
        weatherView.weatherIconImageView.image = UIImage(asset: Asset.Images.weatherImage)
        weatherView.locationIconImageView.image = UIImage(asset: Asset.Icons.location)
        }
}

import SwiftUI
#if DEBUG

@available(iOS 13, *)
struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        HomeViewController().showPreview()
    }
}
#endif
