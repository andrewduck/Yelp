//
//  Filters.swift
//  Yelp
//
//  Created by Andrew Duck on 19/3/16.
//
//  Heavily inspired by Jerry Su
//

import UIKit

class Filters {
    
    var filters = [
        FilterItem(
            label: "Offering a Deal",
            options: [
                FilterOption(label: "Offering a deal", name: "deals_filter", value: "1")
            ],
            type: .Switch
        ),
        FilterItem(
            label: "Distance",
            name: "radius_filter",
            options: [
                FilterOption(label: "Auto", value: "", selected: true),
                FilterOption(label: "500 m", value: "500"),
                FilterOption(label: "1 km", value: "1000"),
                FilterOption(label: "5 km", value: "5000"),
                FilterOption(label: "10 km", value: "10000"),
            ],
            type: .SingleChoice
        ),
        FilterItem(
            label: "Sort By",
            name: "sort",
            options: [
                FilterOption(label: "Best Match", value: "0", selected: true),
                FilterOption(label: "Distance", value: "1"),
                FilterOption(label: "Rating", value: "2"),
            ],
            type: .SingleChoice
        ),
        FilterItem(
            label: "Category",
            name: "categories",
            options: [
                FilterOption(label: "Afghan", value: "afghani"),
                FilterOption(label: "African", value: "african"),
                FilterOption(label: "American (New)", value: "newamerican"),
                FilterOption(label: "American (Traditional)", value: "tradamerican"),
                FilterOption(label: "Arabian", value: "arabian"),
                FilterOption(label: "Argentine", value: "argentine"),
                FilterOption(label: "Armenian", value: "armenian"),
                FilterOption(label: "Asian Fusion", value: "asianfusion"),
                FilterOption(label: "Australian", value: "australian"),
                FilterOption(label: "Austrian", value: "austrian"),
                FilterOption(label: "Bangladeshi", value: "bangladeshi"),
                FilterOption(label: "Barbeque", value: "bbq"),
                FilterOption(label: "Basque", value: "basque"),
                FilterOption(label: "Belgian", value: "belgian"),
                FilterOption(label: "Brasseries", value: "brasseries"),
                FilterOption(label: "Brazilian", value: "brazilian"),
                FilterOption(label: "Breakfast & Brunch", value: "breakfast_brunch"),
                FilterOption(label: "British", value: "british"),
                FilterOption(label: "Buffets", value: "buffets"),
                FilterOption(label: "Burgers", value: "burgers"),
                FilterOption(label: "Burmese", value: "burmese"),
                FilterOption(label: "Cafes", value: "cafes"),
                FilterOption(label: "Cafeteria", value: "cafeteria"),
                FilterOption(label: "Cajun/Creole", value: "cajun"),
                FilterOption(label: "Cambodian", value: "cambodian"),
                FilterOption(label: "Caribbean", value: "caribbean"),
                FilterOption(label: "Catalan", value: "catalan"),
                FilterOption(label: "Cheesesteaks", value: "cheesesteaks"),
                FilterOption(label: "Chicken Wings", value: "chicken_wings"),
                FilterOption(label: "Chinese", value: "chinese"),
                FilterOption(label: "Comfort Food", value: "comfortfood"),
                FilterOption(label: "Creperies", value: "creperies"),
                FilterOption(label: "Cuban", value: "cuban"),
                FilterOption(label: "Czech", value: "czech"),
                FilterOption(label: "Delis", value: "delis"),
                FilterOption(label: "Diners", value: "diners"),
                FilterOption(label: "Ethiopian", value: "ethiopian"),
                FilterOption(label: "Fast Food", value: "hotdogs"),
                FilterOption(label: "Filipino", value: "filipino"),
                FilterOption(label: "Fish & Chips", value: "fishnchips"),
                FilterOption(label: "Fondue", value: "fondue"),
                FilterOption(label: "Food Court", value: "food_court"),
                FilterOption(label: "Food Stands", value: "foodstands"),
                FilterOption(label: "French", value: "french"),
                FilterOption(label: "Gastropubs", value: "gastropubs"),
                FilterOption(label: "German", value: "german"),
                FilterOption(label: "Gluten-Free", value: "gluten_free"),
                FilterOption(label: "Greek", value: "greek"),
                FilterOption(label: "Halal", value: "halal"),
                FilterOption(label: "Hawaiian", value: "hawaiian"),
                FilterOption(label: "Himalayan/Nepalese", value: "himalayan"),
                FilterOption(label: "Hot Dogs", value: "hotdog"),
                FilterOption(label: "Hot Pot", value: "hotpot"),
                FilterOption(label: "Hungarian", value: "hungarian"),
                FilterOption(label: "Iberian", value: "iberian"),
                FilterOption(label: "Indian", value: "indpak"),
                FilterOption(label: "Indonesian", value: "indonesian"),
                FilterOption(label: "Irish", value: "irish"),
                FilterOption(label: "Italian", value: "italian"),
                FilterOption(label: "Japanese", value: "japanese"),
                FilterOption(label: "Korean", value: "korean"),
                FilterOption(label: "Kosher", value: "kosher"),
                FilterOption(label: "Laotian", value: "laotian"),
                FilterOption(label: "Latin American", value: "latin"),
                FilterOption(label: "Live/Raw Food", value: "raw_food"),
                FilterOption(label: "Malaysian", value: "malaysian"),
                FilterOption(label: "Mediterranean", value: "mediterranean"),
                FilterOption(label: "Mexican", value: "mexican"),
                FilterOption(label: "Middle Eastern", value: "mideastern"),
                FilterOption(label: "Modern European", value: "modern_european"),
                FilterOption(label: "Mongolian", value: "mongolian"),
                FilterOption(label: "Moroccan", value: "moroccan"),
                FilterOption(label: "Pakistani", value: "pakistani"),
                FilterOption(label: "Persian/Iranian", value: "persian"),
                FilterOption(label: "Peruvian", value: "peruvian"),
                FilterOption(label: "Pizza", value: "pizza"),
                FilterOption(label: "Polish", value: "polish"),
                FilterOption(label: "Portuguese", value: "portuguese"),
                FilterOption(label: "Russian", value: "russian"),
                FilterOption(label: "Salad", value: "salad"),
                FilterOption(label: "Sandwiches", value: "sandwiches"),
                FilterOption(label: "Scandinavian", value: "scandinavian"),
                FilterOption(label: "Scottish", value: "scottish"),
                FilterOption(label: "Seafood", value: "seafood"),
                FilterOption(label: "Singaporean", value: "singaporean"),
                FilterOption(label: "Slovakian", value: "slovakian"),
                FilterOption(label: "Soul Food", value: "soulfood"),
                FilterOption(label: "Soup", value: "soup"),
                FilterOption(label: "Southern", value: "southern"),
                FilterOption(label: "Spanish", value: "spanish"),
                FilterOption(label: "Steakhouses", value: "steak"),
                FilterOption(label: "Sushi Bars", value: "sushi"),
                FilterOption(label: "Taiwanese", value: "taiwanese"),
                FilterOption(label: "Tapas Bars", value: "tapas"),
                FilterOption(label: "Tapas/Small Plates", value: "tapasmallplates"),
                FilterOption(label: "Tex-Mex", value: "tex-mex"),
                FilterOption(label: "Thai", value: "thai"),
                FilterOption(label: "Turkish", value: "turkish"),
                FilterOption(label: "Ukrainian", value: "ukrainian"),
                FilterOption(label: "Uzbek", value: "uzbek"),
                FilterOption(label: "Vegan", value: "vegan"),
                FilterOption(label: "Vegetarian", value: "vegetarian"),
                FilterOption(label: "Vietnamese", value: "vietnamese")
            ],
            type: .MultiChoice
        )
    ]
    
    static let sharedInstance = Filters()
    
    private init() {}
    
    func copyStateFrom(instance: Filters) {
        for filter in 0 ..< self.filters.count {
            for option in 0 ..< self.filters[filter].options.count {
                self.filters[filter].options[option].selected = instance.filters[filter].options[option].selected
            }
        }
    }
    
    var parameters: Dictionary<String, String> {
        get {
            var parameters = Dictionary<String, String>()
            for filter in self.filters {
                switch filter.type {
                case .SingleChoice:
                    if filter.name != nil {
                        let selectedOption = filter.options[filter.selectedIndex]
                        if selectedOption.value != "" {
                            parameters[filter.name!] = selectedOption.value
                        }
                    }
                case .MultiChoice:
                    if filter.name != nil {
                        let selectedOptions = filter.selectedOptions
                        if selectedOptions.count > 0 {
                            parameters[filter.name!] = selectedOptions.map({ $0.value }).joinWithSeparator(",")
                        }
                    }
                case .Switch:
                    for option in filter.options {
                        if option.selected && option.name != nil && option.value != "" {
                            parameters[option.name!] = option.value
                        }
                    }
                }
            }
            return parameters
        }
    }
}


class FilterItem {
    var label: String
    var name: String?
    var options: Array<FilterOption>
    var type: FilterType
    var opened: Bool = false
    
    init(label: String, name: String? = nil, options: Array<FilterOption>, type: FilterType) {
        self.label = label
        self.name = name
        self.options = options
        self.type = type
    }
    
    var selectedIndex: Int {
        get {
            for i in 0 ..< self.options.count {
                if self.options[i].selected {
                    return i
                }
            }
            return -1
        }
        set {
            if self.type == .SingleChoice {
                self.options[self.selectedIndex].selected = false
            }
            self.options[newValue].selected = true
        }
    }
    
    var selectedOptions: Array<FilterOption> {
        get {
            var options: Array<FilterOption> = []
            for option in self.options {
                if option.selected {
                    options.append(option)
                }
            }
            return options
        }
    }
    
}

enum FilterType {
    case Switch, SingleChoice, MultiChoice
}

class FilterOption {
    
    var label: String
    var name: String?
    var value: String
    var selected: Bool
    
    init(label: String, name: String? = nil, value: String, selected: Bool = false) {
        self.label = label
        self.name = name
        self.value = value
        self.selected = selected
    }
    
}
