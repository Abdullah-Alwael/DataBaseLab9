# Car Parts Warehouse Management System
### This system is designed to help car dealers to manage their warehouse and track where the parts are in various warehouses.
## The parts model:
The parts model will store the name and price of the part that enteres the system  
every car part is stored in only one warehouse  
every warehouse has many car parts  
every car part can fit many car models  
every car model can have many car parts  
every car part is owned by only one owner  
every owner can own many car parts  

## The owner model:
The owner model will store each owner of the part that ordered it  
no other relationships with car model or warehouse  

## The car model:
The car model will store each car model year and make, to trak which part fits which car  
car has no further relationships with owning department or warehouse  

## The warehouse model:
The warehouse model tracks the location of each warehouse in the system, to locate where the parts are stored  
warehouse has no additional relationships with car model nor owners  
