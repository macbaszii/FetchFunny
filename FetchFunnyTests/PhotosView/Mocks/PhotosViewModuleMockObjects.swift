//
//  PhotosViewModuleMockObjects.swift
//  FetchFunnyTests
//
//  Created by Kiattisak Anoochitarom on 18/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit
@testable import FetchFunny

extension InstagramPhoto {
    static let mockInstagramPhoto = InstagramPhoto(id: "1234", type: "image", user: PhotoUser(username: "johnwick"), caption: PhotoCaption(createdTime: "2345678", text: "sample"), multiResolutionImage: MultiResolutionImage(thumbnail: Image(url: "http://instagram.com/thumbnail", width: 60, height: 60), lowResolution: Image(url: "http://instagram.com/low", width: 120, height: 120), standardResolution: Image(url: "http://instagram.com/standard", width: 180, height: 180)))
}

final class MockPhotosViewOutput: PhotosViewOutput, MockInvocable {
    var invocations: [Invocation] = []

    enum Invocation: MockInvocationEnum {
        case viewIsReady
        case fetchPhotos(string: String)
        case tapPhoto(indexPath: IndexPath)
    }

    func viewIsReady() {
        invocations.append(.viewIsReady)
    }

    func fetchPhotos(with string: String) {
        invocations.append(.fetchPhotos(string: string))
    }

    func tapPhoto(at indexPath: IndexPath) {
        invocations.append(.tapPhoto(indexPath: indexPath))
    }
}

final class MockPhotosViewInput: PhotosViewInput, MockInvocable {
    var invocations: [Invocation] = []

    enum Invocation: MockInvocationEnum {
        case needsReloadPhotos
        case showLoadingView
        case hideLoadingView
        case showAlert(alert: UIAlertController)
        case setTitle(title: String)
    }

    func needsReloadPhotos() {
        invocations.append(.needsReloadPhotos)
    }

    func showLoadingView() {
        invocations.append(.showLoadingView)
    }

    func hideLoadingView() {
        invocations.append(.hideLoadingView)
    }

    func showAlert(_ alert: UIAlertController) {
        invocations.append(.showAlert(alert: alert))
    }

    func setTitle(_ title: String) {
        invocations.append(.setTitle(title: title))
    }
}

final class MockPhotosViewInteractorInput: PhotosViewInteractorInput, MockInvocable {
    var invocations: [Invocation] = []

    enum Invocation: MockInvocationEnum {
        case loadMyPhotos
        case loadPhotos(string: String)
    }

    func loadMyPhotos() {
        invocations.append(.loadMyPhotos)
    }

    func loadPhotos(with string: String) {
        invocations.append(.loadPhotos(string: string))
    }
}

final class MockPhotosViewRouterInput: PhotosViewRouterInput, MockInvocable {
    var invocations: [Invocation] = []

    enum Invocation: MockInvocationEnum {
        case navigateToPhotoDetails
    }

    func navigateToPhotoDetails(for photo: InstagramPhoto) {
        invocations.append(.navigateToPhotoDetails)
    }
}

final class MockAlertManager: AlertManager, MockInvocable {
    let expectedAlert = UIAlertController(
        title: "title",
        message: "message",
        preferredStyle: .alert
    )
    var invocations: [Invocation] = []

    enum Invocation: MockInvocationEnum {
        case createAlertView
    }

    func createAlertView(title: String?, message: String?, proceedButtonTitle: String?, cancelButtonTitle: String?, proceedCompletion: (() -> Void)?, cancelCompletion: (() -> Void)?) -> UIAlertController {
        invocations.append(.createAlertView)
        return expectedAlert
    }
}

final class MockPhotosViewInteractorOutput: PhotosViewInteractorOutput, MockInvocable {
    var invocations: [Invocation] = []

    enum Invocation: MockInvocationEnum {
        case didReceivePhotos(photos: [InstagramPhoto])
        case didReceiveErrorRequest(errorMessage: String)
    }

    func didReceivePhotos(_ photos: [InstagramPhoto]) {
        invocations.append(.didReceivePhotos(photos: photos))
    }

    func didReceiveErrorRequest(errorMessage: String) {
        invocations.append(.didReceiveErrorRequest(errorMessage: errorMessage))
    }
}

final class MockInstagramManager: InstagramManager, MockInvocable {
    var invocations: [Invocation] = []

    enum Invocation: MockInvocationEnum {
        case setDelegate(delegate: InstagramManagerDelegate?)
        case autorizationEndpointURL
        case extractAccessToken(url: URL)
        case loadMyRecentPhotos(photosModuleInput: PhotosViewModuleInput?)

    }

    let expectedReturnedURL = URL(string: "https://www.google.com")!
    let expectedErrorMessage = "error!"

    func setDelegate(_ delegate: InstagramManagerDelegate?) {
        invocations.append(.setDelegate(delegate: delegate))
    }

    func autorizationEndpointURL() -> URL {
        invocations.append(.autorizationEndpointURL)
        return expectedReturnedURL
    }

    func extractAccessToken(from url: URL) -> String {
        invocations.append(.extractAccessToken(url: url))
        return expectedErrorMessage
    }

    func loadMyRecentPhotos(photosModuleInput: PhotosViewModuleInput?) {
        invocations.append(.loadMyRecentPhotos(photosModuleInput: photosModuleInput))
    }
}

final class MockPhotoDetailsModuleBuilder: PhotoDetailsModuleBuildable, MockInvocable {
    var invocations: [Invocation] = []

    enum Invocation: MockInvocationEnum {
        case build(photo: InstagramPhoto)
    }

    func build(with photo: InstagramPhoto,
               imageViewURLLoadable: ImageViewURLLoadable) -> UIViewController {
        invocations.append(.build(photo: photo))
        return UIViewController()
    }
}
