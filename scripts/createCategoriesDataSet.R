# Project: Marker Basket Analysis 
# Date: 11 Nov 2019
# Author: Matias Barra

# Script purpose: this script is to create a new data csv file, including the product category
# in order to creat a conexion between Electroindex and Blackwell Electronics


setwd("/Users/matiasbarra/Documents/Data_Analytics_Course/Data_Analytics_2/4_Discover_Associations_Between_Products")
products <- read.csv("./data/ProductLabels.csv", header = TRUE) # read Product Labels as df
sum(products !="") # check total number of products sold

products$ColNueva <- ""
colnames(products)[1] <- "Product"
colnames(products)[2] <- "Category"

view(products)

# create categories for each group of products
accessories <- c("Microsoft Office Home and Student 2016","Computer Game","Belkin Mouse Pad","Large Mouse Pad",
                 "HDMI Cable 6ft", "Ethernet Cable","Etekcity Power Extension Cord Cable",
                 "Audio Cable","VGA Monitor Cable","iPhone Charger Cable","HDMI Adapter",
                 "USB Cable","Samsung Charging Cable","Zombie Gaming Headset","Logitech ClearChat Headset",
                 "Panasonic On-Ear Stereo Headphones","PC Gaming Headset","Kensington Headphones",
                 "Logitech Stereo Headset","Koss Home Headphones","Microsoft Headset","Ailihen Stereo Headphones",
                 "XIBERIA Gaming Headset","Apple Earpods","Monster Beats By Dr Dre","Otium Wireless Sports Bluetooth Headphone",
                 "Panasonic In-Ear Headphone","APIE Bluetooth Headphone","Philips Flexible Earhook Headphone",
                 "3-Button Mouse","Logitech Wireless Mouse","Microsoft Basic Optical Mouse","Logitech 3-button Mouse",
                 "Redragon Gaming Mouse","HP Wireless Mouse","Generic Black 3-Button","Wireless Portable Mouse",
                 "Gaming Mouse Professional","Slim Wireless Mouse","Halter Acrylic Monitor Stand","Height-Adjustable Standing Desk",
                 "Multi Media Stand","Halter Mesh Metal Monitor Stand","Full Motion Monitor Mount","HP USB Keyboard",
                 "Logitech Wireless Keyboard","Rii LED Keyboard","Logitech Keyboard","Backlit LED Gaming Keyboard",
                 "Dell Wired Keyboard","Apple Wired Keyboard","Apple Wireless Keyboard","Apple Magic Keyboard",
                 "Logitech MK550 Wireless Wave Keyboard and Mouse Combo","Logitech Desktop MK120 Mouse and keyboard Combo",
                 "Logitech MK270 Wireless Keyboard and Mouse Combo","Dell KM117 Wireless Keyboard & Mouse",
                 "EagleTec Wireless Combo Keyboard and Mouse","Microsoft Wireless Comfort Keyboard and Mouse",
                 "Microsoft Wireless Desktop Keyboard and Mouse","Rii LED Gaming Keyboard & Mouse Combo",
                 "Logitech MK360 Wireless Keyboard and Mouse Combo")

external_Hardrives <- c("1TB Portable External Hard Drive","2TB Portable External Hard Drive",
                        "5TB Desktop Hard Drive","Slim 2TB Portable External Hard Drive",
                        "3TB Portable External Hard Drive")

tablet <- c("iPad","iPad Pro","Fire HD Tablet","Samsung Galaxy Tablet","Kindle")

PC <- c("Lenovo Desktop Computer","iMac","HP Desktop","ASUS Desktop","Dell Desktop",
        "Intel Desktop","Acer Desktop","CYBERPOWER Gamer Desktop","Dell 2 Desktop")


laptop <- c("LG Touchscreen Laptop","Acer Aspire","HP Laptop","ASUS Chromebook","Apple MacBook Pro",
            "Apple MacBook Air","Dell Laptop","Eluktronics Pro Gaming Laptop",
            "Alienware Laptop","HP Notebook Touchscreen Laptop PC")

display <- c("Acer Monitor","LG Monitor","ASUS Monitor","ASUS 2 Monitor","Dell Monitor",
             "Samsung Monitor","Sceptre Monitor","ViewSonic Monitor","AOC Monitor","HP Monitor")

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

for(i in 1:nrow(products)){

  if( products[i, 1] %in% accessories) { products[i,2] <- "accesories"}
  if( products[i, 1] %in% external_Hardrives) { products[i,2] <- "external_Hardrives"}
  if( products[i, 1] %in% tablet) { products[i,2] <- "tablet"}
  if( products[i, 1] %in% PC) { products[i,2] <- "PC"}
  if( products[i, 1] %in% laptop) { products[i,2] <- "laptop"}
  if( products[i, 1] %in% display) { products[i,2] <- "display"}
  if( products[i, 1] %in% printer) { products[i,2] <- "printer"}
  if( products[i, 1] %in% printerSupplies) { products[i,2] <- "printerSupplies"}
  if( products[i, 1] %in% smart_Home_Devices) { products[i,2] <- "smart_Home_Devices"}
  if( products[i, 1] %in% speakers) { products[i,2] <- "speakers"}
}

view(products)

write.csv(products, file="prodCategories.csv", row.names = FALSE)
