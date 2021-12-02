workspace {


    model {
        MobileApp = person "Mobile App" "" "app"
        GPSSystem = softwareSystem "GPS System" "Telekom" "telekom"
        Emailservices = softwareSystem "Email services"
        
        UserDistanceModule = softwareSystem "User Distance Module" "gets aviable cars near user" 
        InvoicingModule = softwareSystem "Invoicing module" "generate daily summary"
        CarModule = softwareSystem "Car Module" "stores current car status and position"
        GenerateInvoicModule = softwareSystem "Generate invoice Module" "pdf generation"
        GPSModule = softwareSystem "GPS Module" "Stores GPS cars position log"
        DistanceModule = softwareSystem "Distance Module" "calculates car driven distance"
        ParkingModule = softwareSystem "Parking Module" "Handling for parking time"
        DriveModule = softwareSystem "Drive Module" "Handling for driving time"
        RentModule = softwareSystem "Rent Module" "Handling renting"
        CostModule = softwareSystem "Cost Module" "Calculate cost"
 
        MobileApp -> UserDistanceModule "query to get  near cars"
        MobileApp -> ParkingModule "query park"
        MobileApp -> DriveModule "query drive"
        MobileApp -> RentModule "query rent return"
        RentModule -> DriveModule "command drive"
        ParkingModule -> RentModule "command car packed"
        MobileApp -> CostModule "query get cost"
        UserDistanceModule -> CarModule "query get all free cars"
        GPSModule -> CarModule "event update car position"
        GPSModule -> DistanceModule "event update car position"
        GPSSystem -> GPSModule ""
        InvoicingModule -> CostModule "get cost for a rent"
        InvoicingModule -> RentModule "query get all rents for today"
        InvoicingModule -> GenerateInvoicModule "query generate invoice pdf"
        InvoicingModule -> Emailservices "Send email"
        CostModule -> ParkingModule "get parking time"
        CostModule -> DriveModule "query get driven time and distance"
        DriveModule -> DistanceModule "query get driven distance"
    }
    
    views {
        styles {
            element "app" {
                background #c4e288
            }
              element "telekom" {
                background #c4e288
            }
            
        }
    }
}
