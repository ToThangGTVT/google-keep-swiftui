//
//  OAuth2ViewModel.swift
//  keep
//
//  Created by Thắng Tô on 24/08/2023.
//

import Foundation
import AppAuth
import GTMAppAuth
import GoogleAPIClientForREST
import

class OAuth2ViewModel {
    
    private let kIssuer = "https://accounts.google.com"
    private let kRedirectURI = "get your own u scrub"
    private let kClientID = "get your own u scrub"
    let appDelegate = (NSApplication.shared.delegate! as! AppDelegate)

    func auth()
    {
        //need this potatoe
        let issuer = URL(string: kIssuer)!
        let redirectURI = URL(string: kRedirectURI)!

        print("Fetching configuration for issuer: " + issuer.description)
        // discovers endpoints
        OIDAuthorizationService.discoverConfiguration(forIssuer: issuer, completion: {(_ configuration: OIDServiceConfiguration?, _ error: Error?) -> Void in
            if configuration == nil {
                print("Error retrieving discovery document: " + (error?.localizedDescription)!)
                return
            }
            print("Got configuration: " + configuration!.description)
            // builds authentication request
            let scopes = [kGTLRAuthScopeKeep]
            let request = OIDAuthorizationRequest(configuration: configuration!, clientId: self.kClientID, scopes: scopes, redirectURL: redirectURI, responseType: OIDResponseTypeCode, additionalParameters: nil)
            // performs authentication request
            print("Initiating authorization request with scope: " + request.scope!.description)

            self.appDelegate.currentAuthorizationFlow = OIDAuthState.authState(byPresenting: request, presenting: self, callback: {(_ authState: OIDAuthState?, _ error: Error?) -> Void in
                if authState != nil {
                    self.logMessage("Got authorization tokens. Access token: " + (authState?.lastTokenResponse?.accessToken!.description)!)
                    self.authorization = GTMSessionFetcher(authState: authState!)
                    self.service.authorizer = self.authorization
                    self.driveService.authorizer = self.authorization
                    
                    self.saveAuth()
                }
                else {
                    self.logMessage("Authorization error: " + (error?.localizedDescription.description)!)
                }
            })
        })
    }

}
