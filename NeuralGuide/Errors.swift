//
//  Errors.swift
//  NeuralGuide
//
//  Created by Tudor Avram on 04/03/17.
//  Copyright © 2017 Team Lima. All rights reserved.
//

import Foundation

// (1) HTTP-related errors

enum HTTPError: Error {
    case ConnectionError
    case WrongJSONFormat
    case NotaJSON
    case ServerError
    case NoError
}

