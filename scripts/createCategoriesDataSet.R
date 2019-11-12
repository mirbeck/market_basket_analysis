
setwd("/Users/matiasbarra/Documents/Data_Analytics_Course/Data_Analytics_2/4_Discover_Associations_Between_Products")
products <- read.csv("./data/ProductLabels.csv", header = T) # read Product Labels as df
sum(products !="") # check total number of products sold

products$ColNueva <- ""
colnames(products)[1] <- "Product"
colnames(products)[2] <- "Category"

view(products)

# create categories for each group of products
accessories <- c("Microsoft Office Home and Student 2016","Computer Game",
                 "Belkin Mouse Pad","Large Mouse Pad")

computer_Cords <- c("HDMI Cable 6ft", "Ethernet Cable","Etekcity Power Extension Cord Cable",
                    "Audio Cable","VGA Monitor Cable","iPhone Charger Cable","HDMI Adapter",
                    "USB Cable","Samsung Charging Cable")

computer_Headphones <- c("Zombie Gaming Headset","Logitech ClearChat Headset",
                         "Panasonic On-Ear Stereo Headphones RP-HT21",
                         "PC Gaming Headset","Kensington Headphones",
                         "Logitech Stereo Headset","Koss Home Headphones",
                         "Microsoft Headset","Ailihen Stereo Headphones",
                         "XIBERIA Gaming Headset","Apple Earpods","Monster Beats By Dr Dre",
                         "Otium Wireless Sports Bluetooth Headphones",
                         "Panasonic In-Ear Headphone","APIE Bluetooth Headphones",
                         "Philips Flexible Earhook Headphones")

computer_Mice <- c("3-Button Mouse","Logitech Wireless Mouse","Microsoft Basic Optical Mouse",
                   "Logitech 3-button Mouse","Redragon Gaming Mouse","HP Wireless Mouse",
                   "Generic Black 3-Button","Wireless Portable Mouse","Gaming Mouse Professional",
                   "Slim Wireless Mouse")

computer_Stands <- c("Halter Acrylic Monitor Stand","Height-Adjustable Standing Desk",
                     "Multi Media Stand","Halter Mesh Metal Monitor Stand",
                     "Full Motion Monitor Mount")

tablet <- c("iPad","iPad Pro","Fire HD Tablet","Samsung Galaxy Tab","Kindle")

PC <- c("Lenovo Desktop Computer","iMac","HP Desktop","ASUS Desktop","Dell Desktop",
        "Intel Desktop","Acer Desktop","CYBERPOWER Gamer Desktop","Dell 2 Desktop")

external_Hardrives <- c("1TB Portable External Hard Drive","2TB Portable External Hard Drive",
                        "5TB Desktop Hard Drive","Slim 2TB Portable External Hard Drive",
                        "3TB Portable External Hard Drive")

keyboard <- c("HP USB Keyboard","Logitech Wireless Keyboard","Rii LED Keyboard","Logitech Keyboard",
              "Backlit LED Gaming Keyboard","Dell Wired Keyboard","Apple Wired Keyboard",
              "Apple Wireless Keyboard","Apple Magic Keyboard")

laptop <- c("LG Touchscreen Laptop","Acer Aspire","HP Laptop","ASUS Chromebook","Apple Macbook Pro",
            "Apple MacBook Air","Dell Laptop","Eluktronics Pro Gaming Laptop",
            "Alienware AW17R4-7345SLV-PUS 17","HP Notebook Touchscreen Laptop PC")

monitor <- c("Acer Monitor","LG Monitor","ASUS Monitor","ASUS 2 Monitor","Dell Monitor",
             "Samsung Monitor","Sceptre Monitor","ViewSonic Monitor","AOC Monitor","HP Monitor")

mouse_and_Keyboard_Combo <- c("Logitech MK550 Wireless Wave Keyboard and Mouse Combo",
                              "Logitech Desktop MK120 Mouse and keyboard Combo",
                              "Logitech MK270 Wireless Keyboard and Mouse Combo",
                              "Dell KM117 Wireless Keyboard & Mouse",
                              "EagleTec Wireless Combo Keyboard and Mouse",
                              "Microsoft Wireless Comfort Keyboard and Mouse",
                              "Microsoft Wireless Desktop Keyboard and Mouse",
                              "Rii LED Gaming Keyboard & Mouse Combo",
                              "Logitech MK360 Wireless Keyboard and Mouse Combo")
printer <- c("Brother Printer","Canon Office Printer","DYMO Label Manker",
             "Epson Printer","HP Wireless Printer")


printerSupplies <- c("Brother Printer Toner","Canon Ink","DYMO Labeling Tape",
                     "Epson Black Ink","HP Black & Tri-color Ink")

smart_Home_Devices <- c("Apple TV","Fire TV Stick","Google Home",
                        "Roku Express","Smart Light Bulb")

speakers <- c("Bose Companion Speakers","Cambridge Bluetooth Speaker",
              "Cyber Acoustics","DOSS Touch Wireless Bluetooth",
              "JBL Splashproof Portable Bluetooth Speaker","Logitech Multimedia Speakers",
              "Mackie CR Speakers","Rokono Mini Speaker","Sonos")

# for(i in nrow(products)){
#     
#   if( products[i,2] %in% accessories ) { products[i,2] <- "accesories"}
# }


