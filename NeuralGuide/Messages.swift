//
//  Messages.swift
//  NeuralGuide
//
//  Created by Tudor Avram on 04/03/17.
//  Copyright © 2017 Team Lima. All rights reserved.
//

import Foundation

// ====================== ERROR MESSAGES ==============================

var ErrorMessage = [
    HTTPError.ConnectionError: "Could not connect to the Internet.",
    HTTPError.NotaJSON: "Could not connect to the Internet.",
    HTTPError.WrongJSONFormat: "Could not connect tot the Internet.",
    HTTPError.ServerError: "Could not connect to the Internet"
]

// ======================== UI MESSAGES ================================

enum UIMessage: String {
    case welcome = "Hello! Press the lower part of the screen and say What is this"
    case retake = "Press the lower part of the screen to take a new photo"
    case working = "Please wait. The picture is being processed"
}

// ===================== SMALL PARTS FOR ================================
// =========== CONSTRUCTING THE OUTPUTS AND FEEDBACK ====================

/* 
    (1) Output message based on confidence intervals
 */

enum Status: String {
    
    case BigSuccess = "I am pretty sure it is "
    case MediumSuccess = "I think it is "
    case LowSuccess = "It might be "
    case Failure = "Unfortunately, I couldn't see anything in the image."
    
}

/*
    (2) Output messages for various image faults
 */

enum Fault: String {
    
    case tooDark = "The image seems to dark. You might want to try again. "
    case tooBlurry = "The image is kind of blurry. You might want to try again. "
    case bluryAndDark = "The image is both dark and blury. You might want to try again. "
}

