import Foundation

public struct LocationHelper {

    public static let defaultLocationIso2: String = "US"
    
    public static var cellularLocaleIso2: String? {
		if useCoreTelephony {
			return CellularNetworkHelper.getCurrentProviderInfo()?.isoCountryCode
		} else {
			return nil
		}
    }
    
    public static var deviceLocaleIso2: String? {
        guard
            let iso = Locale.current.regionCode,
            !iso.isEmpty
        else {
            return nil
        }
        
        return iso
    }

    public static var currentLocationIso2: String {
        cellularLocaleIso2 ?? deviceLocaleIso2 ?? defaultLocationIso2
    }

    public static func getValidLocationIsoOrDefault(for iso2: Country.ISO2) -> String {
        CountryHelper.getCountry(iso2: iso2)?.iso2 ?? currentLocationIso2
    }
}
