workspace {

    model {


        user_segmento = person "Client"
        user = person "Bar"
        
        
        webApp = softwareSystem "Web Application"{
           app = container "web Application" {
                user -> this "Works ans uses the functions"
                user_segmento -> this "View the events, buys and consumes"
                
            }
            
            movil = container "Mobile App"{
                app -> this "shares the information"
                
            }
            
            businessLogic = container "Business Logic"{
                app -> this "Exposes functionalities"
                
                
                dataMapper = component "Data Mapper"
                email = component "E-mail"
                backend = component "web Application Backend" {
                
                
                    app -> this "Expose funcionalities"
                    app -> email "Uses"
                    app -> dataMapper  "Uses"
                }
                events = component "Events Controller" {
                   app -> this "Expose funcionalities"
                }
            }
            apiApp = container "API Application" {
                businessLogic -> this "Uses"
                movil -> this "Uses"
                
            }
            Notification = container "Notification" {
                app -> this "Uses"
            }
            
            DataBase = container "Data Base" "Data base with all the information of recycle points and users"{
           
               dataMapper -> this "Uses"
                apiApp -> DataBase "Reads and writes to"
                
                
            }
        }
        
        crmSytem = softwareSystem "CRM" {
            webApp -> this "Retrieve user profile"
            

        }
        AddSystem = softwareSystem "Ads System" {
            webApp -> this "Uses and pays for advertisements"
            events -> this "Share details"

        }
        
        EmailSystem = softwareSystem "Email System" {
            AddSystem -> this "Send details of advertisement"
            webApp -> this "Send emails using "
            
            this -> user_segmento "Sends email to"
            this -> user "Sends email to"
            email -> this "Sends e-mail using"
            notification -> this "Send details"
        }
    }

    views {
        
        systemContext webApp {
            include *
            autolayout lr
        }
        container webApp {
            include *
            autolayout 
        }
      
        component businesslogic {
            include *
            autolayout
        }
        theme default
        
    }

}
