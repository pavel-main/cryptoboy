// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: Solana.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

public struct TW_Solana_Proto_Transfer {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var recipient: String = String()

  public var value: UInt64 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct TW_Solana_Proto_Stake {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var validatorPubkey: String = String()

  public var value: UInt64 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct TW_Solana_Proto_DeactivateStake {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var validatorPubkey: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

public struct TW_Solana_Proto_WithdrawStake {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var validatorPubkey: String = String()

  public var value: UInt64 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Create a token account under a main account for a token type
public struct TW_Solana_Proto_CreateTokenAccount {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// main account -- can be same as signer, or other main account (if done on some other account's behalf)
  public var mainAddress: String = String()

  public var tokenMintAddress: String = String()

  public var tokenAddress: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Transfer tokens
public struct TW_Solana_Proto_TokenTransfer {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var tokenMintAddress: String = String()

  public var senderTokenAddress: String = String()

  public var recipientTokenAddress: String = String()

  public var amount: UInt64 = 0

  /// Note: 8-bit value
  public var decimals: UInt32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// CreateTokenAccount and TokenTransfer combined
public struct TW_Solana_Proto_CreateAndTransferToken {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// main account -- can be same as signer, or other main account (if done on some other account's behalf)
  public var recipientMainAddress: String = String()

  public var tokenMintAddress: String = String()

  /// Token address for the recipient, will be created first
  public var recipientTokenAddress: String = String()

  public var senderTokenAddress: String = String()

  public var amount: UInt64 = 0

  /// Note: 8-bit value
  public var decimals: UInt32 = 0

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

/// Input data necessary to create a signed transaction.
public struct TW_Solana_Proto_SigningInput {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var privateKey: Data = Data()

  public var recentBlockhash: String = String()

  public var transactionType: TW_Solana_Proto_SigningInput.OneOf_TransactionType? = nil

  public var transferTransaction: TW_Solana_Proto_Transfer {
    get {
      if case .transferTransaction(let v)? = transactionType {return v}
      return TW_Solana_Proto_Transfer()
    }
    set {transactionType = .transferTransaction(newValue)}
  }

  public var stakeTransaction: TW_Solana_Proto_Stake {
    get {
      if case .stakeTransaction(let v)? = transactionType {return v}
      return TW_Solana_Proto_Stake()
    }
    set {transactionType = .stakeTransaction(newValue)}
  }

  public var deactivateStakeTransaction: TW_Solana_Proto_DeactivateStake {
    get {
      if case .deactivateStakeTransaction(let v)? = transactionType {return v}
      return TW_Solana_Proto_DeactivateStake()
    }
    set {transactionType = .deactivateStakeTransaction(newValue)}
  }

  public var withdrawTransaction: TW_Solana_Proto_WithdrawStake {
    get {
      if case .withdrawTransaction(let v)? = transactionType {return v}
      return TW_Solana_Proto_WithdrawStake()
    }
    set {transactionType = .withdrawTransaction(newValue)}
  }

  public var createTokenAccountTransaction: TW_Solana_Proto_CreateTokenAccount {
    get {
      if case .createTokenAccountTransaction(let v)? = transactionType {return v}
      return TW_Solana_Proto_CreateTokenAccount()
    }
    set {transactionType = .createTokenAccountTransaction(newValue)}
  }

  public var tokenTransferTransaction: TW_Solana_Proto_TokenTransfer {
    get {
      if case .tokenTransferTransaction(let v)? = transactionType {return v}
      return TW_Solana_Proto_TokenTransfer()
    }
    set {transactionType = .tokenTransferTransaction(newValue)}
  }

  public var createAndTransferTokenTransaction: TW_Solana_Proto_CreateAndTransferToken {
    get {
      if case .createAndTransferTokenTransaction(let v)? = transactionType {return v}
      return TW_Solana_Proto_CreateAndTransferToken()
    }
    set {transactionType = .createAndTransferTokenTransaction(newValue)}
  }

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public enum OneOf_TransactionType: Equatable {
    case transferTransaction(TW_Solana_Proto_Transfer)
    case stakeTransaction(TW_Solana_Proto_Stake)
    case deactivateStakeTransaction(TW_Solana_Proto_DeactivateStake)
    case withdrawTransaction(TW_Solana_Proto_WithdrawStake)
    case createTokenAccountTransaction(TW_Solana_Proto_CreateTokenAccount)
    case tokenTransferTransaction(TW_Solana_Proto_TokenTransfer)
    case createAndTransferTokenTransaction(TW_Solana_Proto_CreateAndTransferToken)

  #if !swift(>=4.1)
    public static func ==(lhs: TW_Solana_Proto_SigningInput.OneOf_TransactionType, rhs: TW_Solana_Proto_SigningInput.OneOf_TransactionType) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.transferTransaction, .transferTransaction): return {
        guard case .transferTransaction(let l) = lhs, case .transferTransaction(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.stakeTransaction, .stakeTransaction): return {
        guard case .stakeTransaction(let l) = lhs, case .stakeTransaction(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.deactivateStakeTransaction, .deactivateStakeTransaction): return {
        guard case .deactivateStakeTransaction(let l) = lhs, case .deactivateStakeTransaction(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.withdrawTransaction, .withdrawTransaction): return {
        guard case .withdrawTransaction(let l) = lhs, case .withdrawTransaction(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.createTokenAccountTransaction, .createTokenAccountTransaction): return {
        guard case .createTokenAccountTransaction(let l) = lhs, case .createTokenAccountTransaction(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.tokenTransferTransaction, .tokenTransferTransaction): return {
        guard case .tokenTransferTransaction(let l) = lhs, case .tokenTransferTransaction(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.createAndTransferTokenTransaction, .createAndTransferTokenTransaction): return {
        guard case .createAndTransferTokenTransaction(let l) = lhs, case .createAndTransferTokenTransaction(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      default: return false
      }
    }
  #endif
  }

  public init() {}
}

/// Transaction signing output.
public struct TW_Solana_Proto_SigningOutput {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var encoded: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "TW.Solana.Proto"

extension TW_Solana_Proto_Transfer: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Transfer"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "recipient"),
    2: .same(proto: "value"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.recipient) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.value) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.recipient.isEmpty {
      try visitor.visitSingularStringField(value: self.recipient, fieldNumber: 1)
    }
    if self.value != 0 {
      try visitor.visitSingularUInt64Field(value: self.value, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Solana_Proto_Transfer, rhs: TW_Solana_Proto_Transfer) -> Bool {
    if lhs.recipient != rhs.recipient {return false}
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Solana_Proto_Stake: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Stake"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "validator_pubkey"),
    2: .same(proto: "value"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.validatorPubkey) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.value) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.validatorPubkey.isEmpty {
      try visitor.visitSingularStringField(value: self.validatorPubkey, fieldNumber: 1)
    }
    if self.value != 0 {
      try visitor.visitSingularUInt64Field(value: self.value, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Solana_Proto_Stake, rhs: TW_Solana_Proto_Stake) -> Bool {
    if lhs.validatorPubkey != rhs.validatorPubkey {return false}
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Solana_Proto_DeactivateStake: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".DeactivateStake"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "validator_pubkey"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.validatorPubkey) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.validatorPubkey.isEmpty {
      try visitor.visitSingularStringField(value: self.validatorPubkey, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Solana_Proto_DeactivateStake, rhs: TW_Solana_Proto_DeactivateStake) -> Bool {
    if lhs.validatorPubkey != rhs.validatorPubkey {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Solana_Proto_WithdrawStake: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".WithdrawStake"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "validator_pubkey"),
    2: .same(proto: "value"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.validatorPubkey) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.value) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.validatorPubkey.isEmpty {
      try visitor.visitSingularStringField(value: self.validatorPubkey, fieldNumber: 1)
    }
    if self.value != 0 {
      try visitor.visitSingularUInt64Field(value: self.value, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Solana_Proto_WithdrawStake, rhs: TW_Solana_Proto_WithdrawStake) -> Bool {
    if lhs.validatorPubkey != rhs.validatorPubkey {return false}
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Solana_Proto_CreateTokenAccount: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CreateTokenAccount"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "main_address"),
    2: .standard(proto: "token_mint_address"),
    3: .standard(proto: "token_address"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.mainAddress) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.tokenMintAddress) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.tokenAddress) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.mainAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.mainAddress, fieldNumber: 1)
    }
    if !self.tokenMintAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.tokenMintAddress, fieldNumber: 2)
    }
    if !self.tokenAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.tokenAddress, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Solana_Proto_CreateTokenAccount, rhs: TW_Solana_Proto_CreateTokenAccount) -> Bool {
    if lhs.mainAddress != rhs.mainAddress {return false}
    if lhs.tokenMintAddress != rhs.tokenMintAddress {return false}
    if lhs.tokenAddress != rhs.tokenAddress {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Solana_Proto_TokenTransfer: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".TokenTransfer"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "token_mint_address"),
    2: .standard(proto: "sender_token_address"),
    3: .standard(proto: "recipient_token_address"),
    4: .same(proto: "amount"),
    5: .same(proto: "decimals"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.tokenMintAddress) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.senderTokenAddress) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.recipientTokenAddress) }()
      case 4: try { try decoder.decodeSingularUInt64Field(value: &self.amount) }()
      case 5: try { try decoder.decodeSingularUInt32Field(value: &self.decimals) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.tokenMintAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.tokenMintAddress, fieldNumber: 1)
    }
    if !self.senderTokenAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.senderTokenAddress, fieldNumber: 2)
    }
    if !self.recipientTokenAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.recipientTokenAddress, fieldNumber: 3)
    }
    if self.amount != 0 {
      try visitor.visitSingularUInt64Field(value: self.amount, fieldNumber: 4)
    }
    if self.decimals != 0 {
      try visitor.visitSingularUInt32Field(value: self.decimals, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Solana_Proto_TokenTransfer, rhs: TW_Solana_Proto_TokenTransfer) -> Bool {
    if lhs.tokenMintAddress != rhs.tokenMintAddress {return false}
    if lhs.senderTokenAddress != rhs.senderTokenAddress {return false}
    if lhs.recipientTokenAddress != rhs.recipientTokenAddress {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.decimals != rhs.decimals {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Solana_Proto_CreateAndTransferToken: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".CreateAndTransferToken"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "recipient_main_address"),
    2: .standard(proto: "token_mint_address"),
    3: .standard(proto: "recipient_token_address"),
    4: .standard(proto: "sender_token_address"),
    5: .same(proto: "amount"),
    6: .same(proto: "decimals"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.recipientMainAddress) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.tokenMintAddress) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.recipientTokenAddress) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.senderTokenAddress) }()
      case 5: try { try decoder.decodeSingularUInt64Field(value: &self.amount) }()
      case 6: try { try decoder.decodeSingularUInt32Field(value: &self.decimals) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.recipientMainAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.recipientMainAddress, fieldNumber: 1)
    }
    if !self.tokenMintAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.tokenMintAddress, fieldNumber: 2)
    }
    if !self.recipientTokenAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.recipientTokenAddress, fieldNumber: 3)
    }
    if !self.senderTokenAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.senderTokenAddress, fieldNumber: 4)
    }
    if self.amount != 0 {
      try visitor.visitSingularUInt64Field(value: self.amount, fieldNumber: 5)
    }
    if self.decimals != 0 {
      try visitor.visitSingularUInt32Field(value: self.decimals, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Solana_Proto_CreateAndTransferToken, rhs: TW_Solana_Proto_CreateAndTransferToken) -> Bool {
    if lhs.recipientMainAddress != rhs.recipientMainAddress {return false}
    if lhs.tokenMintAddress != rhs.tokenMintAddress {return false}
    if lhs.recipientTokenAddress != rhs.recipientTokenAddress {return false}
    if lhs.senderTokenAddress != rhs.senderTokenAddress {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.decimals != rhs.decimals {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Solana_Proto_SigningInput: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SigningInput"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "private_key"),
    2: .standard(proto: "recent_blockhash"),
    3: .standard(proto: "transfer_transaction"),
    4: .standard(proto: "stake_transaction"),
    5: .standard(proto: "deactivate_stake_transaction"),
    6: .standard(proto: "withdraw_transaction"),
    7: .standard(proto: "create_token_account_transaction"),
    8: .standard(proto: "token_transfer_transaction"),
    9: .standard(proto: "create_and_transfer_token_transaction"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.privateKey) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.recentBlockhash) }()
      case 3: try {
        var v: TW_Solana_Proto_Transfer?
        if let current = self.transactionType {
          try decoder.handleConflictingOneOf()
          if case .transferTransaction(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.transactionType = .transferTransaction(v)}
      }()
      case 4: try {
        var v: TW_Solana_Proto_Stake?
        if let current = self.transactionType {
          try decoder.handleConflictingOneOf()
          if case .stakeTransaction(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.transactionType = .stakeTransaction(v)}
      }()
      case 5: try {
        var v: TW_Solana_Proto_DeactivateStake?
        if let current = self.transactionType {
          try decoder.handleConflictingOneOf()
          if case .deactivateStakeTransaction(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.transactionType = .deactivateStakeTransaction(v)}
      }()
      case 6: try {
        var v: TW_Solana_Proto_WithdrawStake?
        if let current = self.transactionType {
          try decoder.handleConflictingOneOf()
          if case .withdrawTransaction(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.transactionType = .withdrawTransaction(v)}
      }()
      case 7: try {
        var v: TW_Solana_Proto_CreateTokenAccount?
        if let current = self.transactionType {
          try decoder.handleConflictingOneOf()
          if case .createTokenAccountTransaction(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.transactionType = .createTokenAccountTransaction(v)}
      }()
      case 8: try {
        var v: TW_Solana_Proto_TokenTransfer?
        if let current = self.transactionType {
          try decoder.handleConflictingOneOf()
          if case .tokenTransferTransaction(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.transactionType = .tokenTransferTransaction(v)}
      }()
      case 9: try {
        var v: TW_Solana_Proto_CreateAndTransferToken?
        if let current = self.transactionType {
          try decoder.handleConflictingOneOf()
          if case .createAndTransferTokenTransaction(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {self.transactionType = .createAndTransferTokenTransaction(v)}
      }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.privateKey.isEmpty {
      try visitor.visitSingularBytesField(value: self.privateKey, fieldNumber: 1)
    }
    if !self.recentBlockhash.isEmpty {
      try visitor.visitSingularStringField(value: self.recentBlockhash, fieldNumber: 2)
    }
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every case branch when no optimizations are
    // enabled. https://github.com/apple/swift-protobuf/issues/1034
    switch self.transactionType {
    case .transferTransaction?: try {
      guard case .transferTransaction(let v)? = self.transactionType else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }()
    case .stakeTransaction?: try {
      guard case .stakeTransaction(let v)? = self.transactionType else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }()
    case .deactivateStakeTransaction?: try {
      guard case .deactivateStakeTransaction(let v)? = self.transactionType else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    }()
    case .withdrawTransaction?: try {
      guard case .withdrawTransaction(let v)? = self.transactionType else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
    }()
    case .createTokenAccountTransaction?: try {
      guard case .createTokenAccountTransaction(let v)? = self.transactionType else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
    }()
    case .tokenTransferTransaction?: try {
      guard case .tokenTransferTransaction(let v)? = self.transactionType else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 8)
    }()
    case .createAndTransferTokenTransaction?: try {
      guard case .createAndTransferTokenTransaction(let v)? = self.transactionType else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 9)
    }()
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Solana_Proto_SigningInput, rhs: TW_Solana_Proto_SigningInput) -> Bool {
    if lhs.privateKey != rhs.privateKey {return false}
    if lhs.recentBlockhash != rhs.recentBlockhash {return false}
    if lhs.transactionType != rhs.transactionType {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension TW_Solana_Proto_SigningOutput: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SigningOutput"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "encoded"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.encoded) }()
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.encoded.isEmpty {
      try visitor.visitSingularStringField(value: self.encoded, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: TW_Solana_Proto_SigningOutput, rhs: TW_Solana_Proto_SigningOutput) -> Bool {
    if lhs.encoded != rhs.encoded {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
