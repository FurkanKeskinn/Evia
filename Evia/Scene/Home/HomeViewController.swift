//
//  HomeViewController.swift
//  Evia
//
//  Created by Furkan on 4.12.2023.
//

import UIKit

class HomeViewController: UIViewController {

    private let datas: [String] = ["Arriving Home", "Leaving", "Night Time", "Leaving", "Arrive Home", "Night Time"]
    
  /* private let titleLabel: UILabel = {
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
    */
    private let titleButton: UIButton = {
       let button = UIButton()
        button.setTitle("Home", for: .normal)
        button.titleLabel?.font = .font(.interRegular, size: .large)
        button.setTitleColor(.appBlack, for: .normal)
        button.setImage(UIImage(asset: Asset.Icons.down), for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
         button.addTarget(self, action: #selector(buttonEditTapped), for: .touchUpInside)
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
        layout.estimatedItemSize = CGSize(width: layout.itemSize.width, height: 0)
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
        layout.itemSize = CGSize(width: layout.itemSize.width * 3.2, height: layout.itemSize.height * 2.2) // 160 x 110
        layout.sectionInset = UIEdgeInsets(top: 0, left: layout.itemSize.width / 20, bottom: 0, right: layout.itemSize.height / 15) // 8 - 8
        layout.minimumLineSpacing = layout.itemSize.height / 7 // 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DevicesCollectionViewCell.self, forCellWithReuseIdentifier: DevicesCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
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
        
       // setupGestureRecognizers()
        
        
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
        //titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(titleButton)
        actionStackView.addArrangedSubview(quickActionStackView)
        actionStackView.addArrangedSubview(editButton)
        quickActionStackView.addArrangedSubview(bookmarkIcon)
        quickActionStackView.addArrangedSubview(quickActionLabel)
        view.backgroundColor = .systemBackground
    }
    
    private func applyConstraints() {
        
        let weatherViewConstraints = [
            weatherView.heightAnchor.constraint(equalToConstant: 164),
            weatherView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ]
        let mainStackViewConstraints = [
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ]
        
        let collectionViewConstraints = [
            actionCollectionView.topAnchor.constraint(equalTo: quickActionStackView.bottomAnchor, constant: 15),
            actionCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            actionCollectionView.heightAnchor.constraint(equalToConstant: 48)
        ]
        
        let devicesCollectionViewConstraints = [
            devicesCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            devicesCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 1.36) // 615
        ]
        
        let scrollViewConstraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
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

// MARK: - Actions
extension HomeViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @objc private func buttonAddActionTapped() {
        self.navigationController?.pushViewController(NewQuickActionViewController(), animated: true)
    }
    
    @objc private func buttonEditTapped() {
        self.navigationController?.pushViewController(EditActionsViewController(), animated: true)
    }
    
}

// MARK: - Actions and Devices CollectionView
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
                cell?.actionsButton.addTarget(self, action: #selector(buttonAddActionTapped), for: .touchUpInside)
                return cell!
            }else {
                
                cell?.actionsButton.setTitle(datas[indexPath.row - 1], for: .normal)
                cell?.actionsButton.backgroundColor = cellColors[indexPath.row]
                cell?.actionsButton.setImage(nil, for: .normal)
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

// MARK: - Weather View
extension HomeViewController {
    private func updateWeatherView(city: String, temperature: String) {
            // WeatherView'in içeriğini güncelleyin
            weatherView.cityLabel.text = city
            weatherView.temperatureLabel.text = temperature
            // İkonları güncellemek için gerekirse:
        weatherView.weatherIconImageView.image = UIImage(asset: Asset.Images.weather)
        weatherView.locationIconImageView.image = UIImage(asset: Asset.Icons.location)
        }
}

extension HomeViewController {
   /* private func setupGestureRecognizers() {
        // UITapGestureRecognizer oluştur
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        titleLabel.addGestureRecognizer(tapGesture)
        titleLabel.isUserInteractionEnabled = true // Kullanıcı etkileşimini etkinleştir
    }*/

    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        // Menüyü oluştur
        let menu = UIMenu(title: "Home", children: [
            UIAction(title: "Action 1", image: nil) { _ in
                // Eylem 1'in gerçekleştirilmesi
                print("Action 1 selected")
            },
            UIAction(title: "Action 2", image: nil) { _ in
                // Eylem 2'nin gerçekleştirilmesi
                print("Action 2 selected")
            }
        ])
        
        // Menüyü göster
        if let tapView = sender.view {
            // Menüyü konumlandırmak için bir target ve action seçilmelidir. Aşağıda örnekte hedef olarak nil ve aksiyon olarak boş bir closure kullanılmıştır.
            let menuController = UIMenuController.shared
            menuController.showMenu(from: tapView, rect: tapView.bounds)
        }

    }
}


/*extension HomeViewController {
    private func setupGestureRecognizers() {
        // UITapGestureRecognizer oluştur
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        titleLabel.addGestureRecognizer(tapGesture)
        titleLabel.isUserInteractionEnabled = true // Kullanıcı etkileşimini etkinleştir
    }

    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        // Burada istediğiniz işlemleri gerçekleştirin
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "Action 1", style: .default) { _ in
            // Eylem 1'in gerçekleştirilmesi
            print("Action 1 selected")
        }
        let action2 = UIAlertAction(title: "Action 2", style: .default) { _ in
            // Eylem 2'nin gerçekleştirilmesi
            print("Action 2 selected")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(cancelAction)
        
        present(actionSheet, animated: true, completion: nil)
    }
}*/

import SwiftUI
#if DEBUG

@available(iOS 13, *)
struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        HomeViewController().showPreview()
    }
}
#endif
