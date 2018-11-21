//
//  Collection+.swift
//  FetchFunny
//
//  Created by Anoochitarom, Kiattisak (Agoda) on 21/11/2561 BE.
//  Copyright © 2561 Anoochitarom, Kiattisak (Agoda). All rights reserved.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
