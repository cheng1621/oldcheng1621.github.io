---
layout: post
title:  "Design Parking Lot"
date: 2021-12-21 19:10:10 +0800
categories: [OOD]
tags: [OOD]
mermaid: true
---

# Design Parking Lot.
## System Requirement.
1. parking lot should have multiple floors, floors contain multiple spots.  
2. multiple entry and exit points. (implement later).
3. customer get a ticket from entry point and return ticket at the exit point.
4. payment can be **in cash** and via **credit card**.  

```mermaid
classDiagram
class Vehicletype {
        <<enumeration>>
        Car
        Truck
        Bike
    }
    class ParkingSpotType {
        <<enumeration>>
        Small
        Mediam
        Large
        XLarge
    }
    class AccountStatus {
        <<enumeration>>
        Active
        Closed
        Canceled
    }
```
```mermaid
classDiagram
    %% ParkingLot, ParkingFloor and ParkingSpot.  
    ParkingLot "1" o-- "1..*" ParkingFloor
    ParkingFloor "1" o-- "1..*" ParkingSpot
    class ParkingLot {
        Address: string
        id: int

        addEntryPoints() bool
        isFull() bool
        getTicket() Ticket
        addAttendant() : bool
        removeParkingRate() : bool
        scanTicket() : bool
    }
    class ParkingFloor {
        id: int
        isFull() bool
    }
    class ParkingSpot {
        id: int
        type: ParkingSpotType
        CarNumber: string
        Available: bool
        
        Free()  bool
    }
    
    %% end
    %% entry points. (suppose there is one entry point)
    ParkingLot o-- Entrance
    ParkingLot o-- ExitPoint
    class Entrance {
        id: int

        print() void
        getTicket() Ticket
    }
    
    class ExitPoint{
        id: int

        scanTicket() bool
        processPayment() bool
    }
    
    class Attendant {
        id : int
        scanTicket() bool
        processPayment() bool
    }
    
    %% Payment
    Payment <|-- CreditCardTransaction
    Payment <|-- CashTransaction
    class Payment {
        CreationDate : int 
        Amount: double

        initialization(): bool
    }

    class CreditCardTransaction {
        name: string
    }

    class CashTransaction {

    }

    %% Account
    Account <|-- Admin
    Account <|-- Customer
    Account <|-- Attendant
    class Account {
        username : string
        password : string
        status : AccountStatus
    }
    class Admin {
        addAttendant() : bool
    }
    class Customer {
        getticket() : bool
    }
    class Attendant {
        processticket() : bool
    }
    
     %% Vehicle
    Vehicle <|-- Car
    Vehicle <|-- Truck
    Vehicle <|-- Bike
    class Vehicle {
        licenseNumber : string
        type : Vehicletype
    } 
    class Car
    class Truck 
    class Bike
    
```


# Design library.
## system requirement.
1. customer can **borrow** a book from library **return** the book to the library.  
2. customer could **buy** book from libary.  
3. customer can **search** for keyword. (library should return the recommended book).
4. Attendat can add or remove the new book to the system.  
5. customer could be notified if the book is available.

## class hierarchy.
```mermaid
classDiagram
    %% Library.
    library o-- Panel
    library o-- Book
    class library {
        id : int
        address: string
        zipcode: int
        description : string

        search(string keyword) : Book
        Borrow(Book) : bool
        Return(Book) : bool
        Buy(book) : bool
        Add(Book) : bool
        Remove(book): book
    }

    class Panel {
        id : int 

        search(string keyword) : Book
        Borrow(Book) : bool
        Return(Book) : bool
        Buy(book) : bool
        Add(Book) : bool
        Remove(book): book
    }

    %% Book
    class Book {
        id : int
        name: string
        author : string
        PublishedDate: datetime
        Location: string
        Status: BookStatus
        type: Booktype
        Amount: int
    }
    class BookStatus {
        <<enumeration>>
        Active
        Borrowed
        Removed
    }
    class Booktype {
        <<enumeration>>
        EconomicBook
        BusinessBook
        EntainmentBook
    }

    Book <|-- Bookitem
    %% class Bookitem {
        id : int
        barcode : string
        Status: BookStatus
        type : Booktype
    }

    %% BookLending.
    class BookLending {
        User: Account
        Bookitem: bookitem
        creationTime: datetime
        dueDate: datetime
        returnDate: dateTime.
    }
    

    %% Account
    library o-- Account
    Account <|-- Admin
    Account <|-- Member
    class Account {
        username: string
        password: string
        email: string
        id : int
        type: AccountType
    }
    class AccountType {
        <<enumeration>>
        Admin
        Customer
        Attendant
    }
    class Admin {
        addBook(): bool
        removeBook(): bool
        renewBook(): bool
        ReturnBook(): bool
        addMember(): bool
    }
    class Member {
        num_borrow : int
        borrowItem: booktime
        borrow()
        return()
        renewBook(): bool
    }
    
    %% fine transaction.
    class fine {
        amount: double
        getAmount() : double
    }
    fineTransaction <|-- CreditCardTransaction
    fineTransaction <|-- CashTransaction
    class fineTransaction {
        Amount : double
        intialization() : bool
    }

    class CreditCardTransction {

    }
    class CashTransction {

    }
```



# Design online Amazon shopping system.(OOD)
# requirement
1. Member could **buy** items or **return** items. 
2. Member could add item to shopping card.
3. Member could add comment to purchased items.
4. Member could pay with credit card or debit card.
5. Member could search for items by the name or catogory.
6. Member could keep track of the shippment.


# class hierarchy.
```mermaid
classDiagram
    %% Account
    class Address {
        <<data type>>
        name : string
        zipcode : int
    }
    class Account {
        username: string
        password: string
        email : string
        ShipmentAddress : Address
        mobile : string

        resetPassword() : bool
    }

    class Admin {
        addCatogory()
    }
    class Guest {
        search() : Product
    }
    class Member {
        search() : Product
        buy() : bool
        addToShoppingCard() : bool
        AddComment() : bool
        Shippment() 
        returnItem()
    }
    Account <|-- Admin
    Account <|-- Guest
    Account <|-- Member

    %% Product.
    class Product {
        productId: int
        name : string
        rating: int
        description: string
        userId: int
        prices : double
        category: ProductCategory
    }

    class ProductCategory {
        <<enumeration>>
        Game
        Kid
        Food
    }

    %% used for search.
    Product o-- Catalog
    class Catalog {
        productName : map(name,list(product))
        productCategory: map(ProductCategory,list(product))
    }

    class item {
        amount: int
        prices: double
        updateAmount() : bool
    }
    item -- Product
    %% Shopping Card
    class ShoppingCard {
        items: list(items) 
        print() : void
        removeItem() : bool
        AddItem() : bool
    }
    Member o-- ShoppingCard

    %% Order
    Order o-- OrderLog
    Member o-- Order
    class Order{
        OrderId : string
        status : OrderStatus
        orderDate: datetime
    }

    %% OrderLog
    class OrderLog {
        creationDate: datetime
        status : OrderStatus
    }

    %% shippment
    class Shippment {
        ShippmentDate: date
        estimateArrival: date
    }
    %% shippment log
    class ShippmentLog {
        creationDate: datetime
        status : OrderStatus
    }
    Shippment o-- ShippmentLog
    Member o-- Shippment

    %% Payment
    class Payment {
        amount : double
    }
    class CreditCardPayment {
        intilization()
    }
    class DebitCardPayment {
        initialization()
    }
    Payment <|-- CreditCardPayment
    Payment <|-- DebitCardPayment

    %% Notification
    class Notification {
        notificationId : int
        content: string
        sendNotification() : bool
    }
    class EmailNotification {
        email : string
    }
    Notification <|-- EmailNotification
    Notification o-- Shippment
```


# design stackOverflow
## Requirement
1. Guests can search for questions.
2. Users can post a **question** and post an **answer** to a question.  (member)
3. users and upvote for answer (member).
4. member can add a comment on the comment section.  
5. member can tag the questions.  
6. System can identify most frequently used tags in the questions.  


## 
```mermaid
classDiagram
    %% actors. (Admin, guest, member, system)
    User <|-- Admin
    User <|-- Member
    class User {
        username: string
        password: string
        email: string
    }
    class Admin {
        closeQuestion(): bool
        addCatogery(): bool
    }
    class Member {
        PostQuestion(): bool
        PostAnswer(): bool
        AddComment(): bool
        UpVote() : bool
    }
    class Guest {
        search();
    }

    %% Question & answer.
    class Question {
        title: string
        description: string
        Id: int
        viewCount : int
        voteCount : int
        creationDate : datetime
        status : QuestionStatus
        
    }
    class Answer {
        description: string
        accepted: bool
        votes: int
        createDate: Time
    }
```