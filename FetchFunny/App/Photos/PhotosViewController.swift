//
//  PhotosViewController.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

final class PhotosViewController: UIViewController, PhotosViewInput, NibLoadable {
    typealias NibRootType = PhotosViewController

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var output: PhotosViewOutput?
    var dataSource: PhotosViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        output?.viewIsReady()
    }

    func needsReloadPhotos() {
        collectionView.reloadData()
    }

    func showLoadingView() {
        loadingView.isHidden = false
        activityIndicator.startAnimating()
    }

    func hideLoadingView() {
        loadingView.isHidden = true
        activityIndicator.stopAnimating()
    }

    func showAlert(_ alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }

    func setTitle(_ title: String) {
        navigationItem.title = title
    }

    // MARK: - Private
    private func setupView() {
        activityIndicator.hidesWhenStopped = true
        hideLoadingView()
        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            UINib(
                nibName: String(describing: PhotoCell.self),
                bundle: nil),
            forCellWithReuseIdentifier: String(
                describing: PhotoCell.self
            )
        )
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white

    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension PhotosViewController: UICollectionViewDataSource,
                                UICollectionViewDelegate,
                                UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return dataSource?.numberOfPhotos() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: PhotoCell.self),
            for: indexPath
        ) as! PhotoCell

        cell.imageViewURLLoadable = ImageViewURLLoadableImplementation()

        let currentPhoto = dataSource?.photo(at: indexPath)
        let viewModel = PhotoCellViewModel(
            urlString: currentPhoto?.multiResolutionImage.thumbnail.url ?? ""
        )
        cell.configureCell(with: viewModel)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output?.tapPhoto(at: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width / 3.0
        let height = width

        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
