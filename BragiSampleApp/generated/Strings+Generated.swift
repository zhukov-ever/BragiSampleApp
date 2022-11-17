// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Alert {
    internal enum Connecting {
      /// connecting
      internal static let title = L10n.tr("Localizable", "alert.connecting.title")
    }
    internal enum ConnectionError {
      /// connection error
      internal static let title = L10n.tr("Localizable", "alert.connectionError.title")
    }
    internal enum ConnectionEstablished {
      /// connection established
      internal static let title = L10n.tr("Localizable", "alert.connectionEstablished.title")
    }
    internal enum MessageSent {
      /// message sent
      internal static let title = L10n.tr("Localizable", "alert.messageSent.title")
    }
  }

  internal enum Global {
    /// Hello World!
    internal static let hello = L10n.tr("Localizable", "global.hello")
  }

  internal enum View {
    internal enum ForgotPassword {
      /// Forgot Password
      internal static let title = L10n.tr("Localizable", "view.forgotPassword.title")
      internal enum Button {
        /// Forgot Password
        internal static let forgotPassword = L10n.tr("Localizable", "view.forgotPassword.button.forgotPassword")
      }
    }
    internal enum Login {
      /// Log In
      internal static let title = L10n.tr("Localizable", "view.login.title")
      internal enum Button {
        /// Log In
        internal static let login = L10n.tr("Localizable", "view.login.button.login")
        /// Send Commands
        internal static let sendCommand = L10n.tr("Localizable", "view.login.button.sendCommand")
      }
    }
    internal enum SignUp {
      /// Sign Up
      internal static let title = L10n.tr("Localizable", "view.signUp.title")
      internal enum Button {
        /// Sign Up
        internal static let signUp = L10n.tr("Localizable", "view.signUp.button.signUp")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
