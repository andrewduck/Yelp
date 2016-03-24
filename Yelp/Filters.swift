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
    
    var filters = []
    
    init(instance: Filters? = nil, config: [AnyObject]?) {
        if instance != nil {
            self.copyStateFrom(instance!)
        }
        if config != nil {
            loadConfig(config)
        }
    }
    
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
                default:
                    continue
                }
            }
            return parameters
        }
    }
    
    class var instance: Filters {
        struct Static {
            static let instance: Filters = Filters()
        }
        return Static.instance
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
