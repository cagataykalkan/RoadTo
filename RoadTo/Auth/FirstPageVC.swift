//
//  FirstPageVC.swift
//  RoadTo
//
//  Created by Çağatay KALKAN on 29.07.2024.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import AuthenticationServices
import CryptoKit

class FirstPageVC: UIViewController {
    private var currentNonce: String?
    
    @IBOutlet weak var appleView: UIView!
    @IBOutlet weak var mailView: UIView!
    @IBOutlet weak var googleView: UIView!
    
    @IBOutlet weak var signInWithMailButton: UIButton!
    @IBOutlet weak var signInWithGoogleButton: UIButton!
    @IBOutlet weak var signInWithAppleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setDelegateAndButtonactions()
    }
    
    func setupUI() {
        appleView.layer.borderWidth = 2
        appleView.layer.cornerRadius = 30
        googleView.layer.borderWidth = 2
        googleView.layer.cornerRadius = 30
        mailView.layer.borderWidth = 2
        mailView.layer.cornerRadius = 30
    }
    
    func setDelegateAndButtonactions() {
        signInWithGoogleButton.addTarget(self, action: #selector(signInWithGoogleButtonAction), for: .touchUpInside)
        signInWithAppleButton.addTarget(self, action: #selector(signInWithAppleButtonAction), for: .touchUpInside)
    }
    
    @objc func signInWithGoogleButtonAction() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [weak self] result, error in
            guard let user = result?.user, let idToken = user.idToken?.tokenString else { return }
            self?.signInWithGoogle(idToken: idToken, accessToken: user.accessToken.tokenString)
        }
    }
    
    func signInWithGoogle(idToken: String, accessToken: String) {
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        Auth.auth().signIn(with: credential) { result, error in
            guard let _ = result, error == nil else { return }
            self.loginToWelcome()
        }
    }
    
    func loginToWelcome() {
        performSegue(withIdentifier: K.identifiers.loginToWelcome, sender: self)
    }
    
    @objc func signInWithAppleButtonAction() {
        startSignInWithAppleFlow()
    }
    
    @available(iOS 13.0, *)
    func startSignInWithAppleFlow() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }

}

extension FirstPageVC: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let idToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)
            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idToken!, rawNonce: nil)
            
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error = error {
                    // Hata işleme
                    return
                }
                // Başarılı oturum açma
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Hata işleme
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
