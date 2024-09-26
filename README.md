# Assigment explanation

The project was orgnize in a modular architecture thought to easily be splited into different packages as the team grows and work has to be made in parallel keeping independent from each other.

### Core 

The core module contains reusable code, like networking layer, persistance interface, logging, and UI reusable code.


### Domain

The domain module can be splitted in different packages or in one package with submodules (monorepo), each module will contain related code to deliver a feature.

- Model: Contanis the data structures for this module.
- Provider: Repositories/Services in charge to orchastate different data sources (cache, coredata, network API) to provide the data to the UI. 
- UI: Differents views and viewModels.

### Apps

This modular architecture supports to have different apps, for example if there is variations between countries, or if there are multiple brands. So each app can configure its resources and inject them to the rest of the modules.

![Architecture Diagram](https://github.com/sebasf8/DatePickerAssigment/blob/main/Architechture.png?raw=true)


## UI 

**MVVM + Coordinator:** The UI code was organized using the MVVM pattern since there is a mix between UIKit and SwiftUI, and MVVM is the most common choice for SwiftUI development. This approach makes it easier to migrate a UIKit view to SwiftUI while maintaining the ViewModel with little to no changes.
Navigation is achieved using the Coordinator pattern to decouple the views from navigation, which again simplifies the migration between UI frameworks.
