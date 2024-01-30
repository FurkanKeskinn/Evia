//
//  WeatherView.swift
//  Evia
//
//  Created by Furkan on 27.01.2024.
//

import UIKit

public class WeatherView: UIView {
    public let weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public let cityLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.interRegular, size: .h8)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let locationIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .font(.interRegular, size: .xlarge)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let seeMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See More", for: .normal)
        button.titleLabel?.font = .font(.interMedium, size: .small)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = .appWeather
        layer.cornerRadius = 16
    }
    
    private func setupViews() {
        // Bileşenleri görünüme ekleme
        addSubview(weatherIconImageView)
        addSubview(cityLabel)
        addSubview(locationIconImageView)
        addSubview(temperatureLabel)
        addSubview(seeMoreButton)
        applyConstraints()
        
        // Layout işlemleri
        // Özelleştirme ve konumlandırma için constraints ekle
    }
    
    private func applyConstraints() {
        
        let weatherIconImageViewConstraints = [
            weatherIconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
                
        ]
        NSLayoutConstraint.activate(weatherIconImageViewConstraints)
        
        let locationIconImageViewConstraints = [
            
            locationIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            locationIconImageView.leadingAnchor.constraint(equalTo: weatherIconImageView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(locationIconImageViewConstraints)
        
        let cityLabelConstraints = [
            cityLabel.leadingAnchor.constraint(equalTo: locationIconImageView.trailingAnchor, constant: 4),
            cityLabel.centerYAnchor.constraint(equalTo: locationIconImageView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(cityLabelConstraints)
        
        let temperatureLabelConstraints = [
            temperatureLabel.leadingAnchor.constraint(equalTo: locationIconImageView.leadingAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: locationIconImageView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(temperatureLabelConstraints)
        
        let seeMoreButtonConstraints = [
            seeMoreButton.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            seeMoreButton.leadingAnchor.constraint(equalTo: temperatureLabel.leadingAnchor)
        ]
        NSLayoutConstraint.activate(seeMoreButtonConstraints)
    }
    
    // swiftlint:disable fatal_error
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error
}
