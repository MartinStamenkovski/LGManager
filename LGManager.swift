//
//  LGManager.swift
//
//  Created by Martin Stamenkovski on 2/9/19.
//
import UIKit

protocol Localizable {
    var localized: String { get }
}

protocol XIBLocalizable {
    var xibLocalizedKey: String? { get set }
}

/**
 Change application language.
 
 This class is mostly used when you need to change your application language to some of not supported languages by Apple.
 */
class LGManager {
    
    private static var bundle: Bundle!
    
    ///Load saved language prefix if any, default *en*.
    public static func localizedBundle() -> Bundle! {
        if bundle == nil {
            let selectedLanguagePrefix = UserDefaults.standard.string(forKey: "app_lang") ?? "en"
            let path = Bundle.main.path(forResource: selectedLanguagePrefix, ofType: "lproj")
            self.bundle = Bundle(path: path!)
        }
        return bundle;
    }
    /**
     Set current language.
     
     Update current application language with the given prefix.
     
     - Parameter prefix: The language prefix, for example *en*.
     */
    public static func setLanguage(with prefix: String) {
        UserDefaults.standard.set(prefix, forKey: "app_lang")
        let path = Bundle.main.path(forResource: prefix, ofType: "lproj")
        self.bundle = Bundle(path: path!)
    }
    
    ///Current selected language.
    class func selectedLanguage(defaultPrefix: String = "en") -> String {
        return UserDefaults.standard.string(forKey: "app_lang") ?? defaultPrefix
    }
}


extension String: Localizable {
    
    public var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: LGManager.localizedBundle(), value: "", comment: "")
    }
    
    public func localize(key: String) -> String {
        return NSLocalizedString(key, tableName: nil, bundle: LGManager.localizedBundle(), value: "", comment: "")
    }
    
    public static func localize(key: String) -> String {
        return NSLocalizedString(key, tableName: nil, bundle: LGManager.localizedBundle(), value: "", comment: "")
    }
}

extension UILabel: XIBLocalizable {
    
    @IBInspectable
    public var xibLocalizedKey: String? {
        get { return nil }
        set(key) {
            text = key?.localized
        }
    }
}

extension UITextField {
    @IBInspectable
    public var xibLocalizedPlaceholder: String? {
        get { return nil }
        set(key) {
            placeholder = key?.localized
        }
    }
}

extension UITabBarItem: XIBLocalizable {
    
    @IBInspectable
    public var xibLocalizedKey: String? {
        get { return nil }
        set(key) {
            title = key?.localized
        }
    }
}

extension UINavigationItem: XIBLocalizable {
    
    @IBInspectable
    public var xibLocalizedKey: String? {
        get { return nil }
        set(key) {
            title = key?.localized
        }
    }
}
extension UIButton: XIBLocalizable {
    
    @IBInspectable
    public var xibLocalizedKey: String? {
        get { return nil }
        set(key) {
            setTitle(key?.localized, for: .normal)
        }
    }
}

extension UIBarButtonItem: XIBLocalizable {
    
    @IBInspectable
    public var xibLocalizedKey: String? {
        get { return nil }
        set(key) {
            title = key?.localized
        }
    }
}

extension UIViewController: XIBLocalizable {
    
    @IBInspectable
    public var xibLocalizedKey: String? {
        get { return nil }
        set(key) {
            title = key?.localized
        }
    }
}
