import Foundation

public class CountryHelper {
    public static func getCountry(name: String) -> Country? {
        countries.first { $0.localizedName == name }
    }

    public static func getCountry(countryCode: Int) -> Country? {
        countries.first { $0.countryCode == countryCode }
    }

    public static func getCountry(iso2: String?) -> Country? {
        guard let iso2, !iso2.isEmpty
        else { return nil }

        return countries.first { $0.iso2 == iso2.uppercased() }
    }

    public static func getCountry(iso3: String?) -> Country? {
        guard let iso3, !iso3.isEmpty
        else { return nil }

        return countries.first { $0.iso3 == iso3.uppercased() }
    }

    public static var countries: [Country] {
        get { CountriesResource.countries }
    }
}
