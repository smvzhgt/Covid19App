//
//  FormatUtil.swift
//  Covid19App
//
//  Created by oleg on 24.09.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//

import Foundation

final class FormatUtil {
    
    static func formatValue(value: Int?) -> String? {
        let valueFormatter = NumberFormatter()
        valueFormatter.numberStyle = NumberFormatter.Style.decimal
        valueFormatter.groupingSeparator = ","
        return valueFormatter.string(from: NSNumber(value:value ?? 0))
    }
}
