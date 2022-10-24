import Foundation

public struct LocationHelper {

    public static let defaultLocationIso: String = "US"
    
    public static var cellularLocaleIso: String? {
		if useCoreTelephony {
			return CellularNetworkHelper.getCurrentProviderInfo()?.isoCountryCode
		} else {
			return nil
		}
    }
    
    public static var deviceLocaleIso: String? {
        guard
            let iso = Locale.current.regionCode,
            !iso.isEmpty
        else {
            return nil
        }
        
        return iso
    }

    public static var currentLocationIso: String {
        cellularLocaleIso ?? deviceLocaleIso ?? defaultLocationIso
    }

    public static func getValidLocationIsoOrDefault(for iso: String) -> String {
        CountryHelper.getCountry(iso: iso)?.iso ?? currentLocationIso
    }
}
