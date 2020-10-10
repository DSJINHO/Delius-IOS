//
//  SignupPhoneProtocol.swift
//  DeliusV1.0.0
//
//  Created by 정윤환 on 06/05/2020.
//  Copyright © 2020 정윤환. All rights reserved.
//
protocol SignupPhoneProtocol{
    func complete(verificationCode code:String)
    func sendSMS(phoneNumber ph:String)
}
