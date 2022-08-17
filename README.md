# RoomsPersonApp

This Project is implemented with multi Layered Architecture with MVVMC-Repository pattern. 


## Modules

* ** Room/View
      * **  View: 
        * UI is created using storyboard, this is using tableView/CollectionView. 
      * ** ViewModel: 
        * View model has all business logic related to room view.
      * **  UseCase:
        * ViewModel communicate to use case to get rooms data. 
      * **   Repository: 
        * Has logic to get data from network layer and parse the data to model objects and send back to usecase. 
      * **  Model :
        * ReponseModel object which is received from api call, Entity Model to communicate to UI layer. 
* ** CoreNetwork
       * This layer is developed as seperate reusable Swift package manager project. 
       * This is using URLSession to do REST Api call. 

* **Localization** = Localizable string file is created to support multiple langauges , currently its supporting english only.

* **AppCoordinator** = This handles other coordinators for navigation to different modules. 


## Design Patterns

* Initiizer dependecy and property injection patterns is used to insert objects
* Protocols are used for dependency inversion. 
* Async Await pattern. 
* Publisher subscriber pattern to do data binding. 

## Testing.

* ** Unit Tests 
   * for ViewModel
   * for UseCases
   * for Repository
   
   
## Modularization 

    * Used SPM to seperate REST API layer to CoreNetwork Framework. 
    
## Accessibility 

  * Dynamic Fonts are implemeted
  * Used UIFontMetrics to support custom fonts. 
  * Voice over is read the elements with proper context and order.        
   


