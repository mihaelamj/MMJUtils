//
//  Collection+Safe..swift
//  MMJUtils - CollectionUtil
//
//  Created by Mihaela Mihaljevic Jakic on 25.05.2021..
//

public extension Collection {
  // INFO: -  Returns the element at the specified index if it is within bounds, otherwise nil.
  subscript(safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
