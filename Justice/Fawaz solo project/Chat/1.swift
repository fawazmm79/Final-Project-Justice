//
//  1.swift
//  Fawaz solo project
//
//  Created by Fawaz on 16/12/2021.
//

import Foundation
import MessageKit


struct SenderMKit: SenderType {
    var senderId: String
    var displayName: String
}

struct MessageKit: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}
