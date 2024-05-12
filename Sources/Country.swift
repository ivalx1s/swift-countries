import Foundation

public struct Country: Equatable, Hashable, Codable  {
    public typealias ISO2 = String
    public typealias ISO3 = String

    public let iso2: ISO2
    public let iso3: ISO3
    public let phoneCode: Int
    public let countryCode: Int
    public let name: String

    public init(
            iso2: ISO2,
            iso3: ISO3,
            countryCode: Int,
            phoneCode: Int,
            name: String
    ) {
        self.iso2 = iso2
        self.iso3 = iso3
        self.countryCode = countryCode
        self.phoneCode = phoneCode
        self.name = name
    }

    public static func ==(lhs: Country, rhs: Country) -> Bool {
        lhs.iso2 == rhs.iso2
    }
}

public extension Country {
    var localizedName: String {
        let locale = NSLocale.current as NSLocale
        return localizedName(for: locale)
    }

    func localizedName(for locale: NSLocale) -> String {
        let name = locale.displayName(forKey: .countryCode, value: iso2)

        return name ?? ""
    }

    var emoji: String {
        let iso = iso2.uppercased()
        let emoji = iso
                .unicodeScalars
                .compactMap { UnicodeScalar(127397 + $0.value) }
                .map { String($0) }
                .joined()

        return emoji
    }
}