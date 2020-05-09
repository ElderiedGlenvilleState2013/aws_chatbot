//
//  ViewController.swift
//  chatty_chatbot
//
//  Created by McKinney family  on 5/8/20.
//  Copyright © 2020 FasTek Technologies. All rights reserved.
//

import UIKit
import AWSLex
import AWSMobileClient

class ViewController: UIViewController, AWSLexVoiceButtonDelegate {
    func voiceButton(_ button: AWSLexVoiceButton, onError error: Error) {
        print(error.localizedDescription)
    }
    

    @IBOutlet weak var btnBot: AWSLexVoiceButton!  // (btn bot) is uiView that displays voice btn
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        //cognito codes
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.USEast1,
           identityPoolId:"us-east-1:d461985e-4b40-4eb4-9d03-373e245261ab")

        let configuration = AWSServiceConfiguration(region:.USEast1, credentialsProvider:credentialsProvider)

        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        let botConfig = AWSLexInteractionKitConfig.defaultInteractionKitConfig(withBotName: "mealBot", botAlias: "firstrelease")
        
        AWSLexInteractionKit.register(with: configuration!, interactionKitConfiguration: botConfig, forKey: AWSLexVoiceButtonKey)
        
        btnBot.delegate = self // btn bot delegat, view
    } // end of viewdidload


}

