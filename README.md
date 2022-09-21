<p align="center">
<img width="445" alt="Screen Shot 2022-09-21 at 12 52 42 PM" src="https://user-images.githubusercontent.com/85247765/191565062-85631a63-2b96-43e2-b9f3-22677f08e441.png">
	</p>


# API Usage
- Base URL:     `http://localhost:3000`


- Available Endpoints:
  - [Customer Endpoints](#CUSTOMER)
  - [Tea Endpoints](#TEA)
  - [Subscription Endpoints](#SUBSCRIPTION)





# CUSTOMER


**Create**

- This endpoint consumes json data, looks for a customer, and if no customer exists creates one. 
	

``` ruby
[POST] /api/v1/customers


Required BODY: 
 {
  "first_name": "example",
  "last_name": "example",
  "email": "example",
  "address": "example"
}
```

 Example:

``` ruby 
[POST] /api/v1/customers

 - Body: 
	 {
  "first_name": "Fryce",
  "last_name": "Wein",
  "email": "Fryce.wein@gmail.com",
  "address": "816 Shetland Drive Chesapeake Va 23322"
}
```

RESPONSE:

```json
{
    "data": {
        "id": "3",
        "type": "customer",
        "attributes": {
            "first_name": "Fryce",
            "last_name": "Wein",
            "email": "Fryce.wein@gmail.com",
            "address": "816 Shetland Drive Chesapeake Va 23322"
        },
        "relationships": {
            "subscriptions": {
                "data": []
            }
        }
    }
}
```
---


**Find Customer**

- This endpoint finds an existing user, based on user id

``` ruby
[GET] /api/v1/customer

Required BODY: 
 {
  "first_name": "example",
  "last_name": "example",
  "email": "example",
  "address": "example"
}
```



 Example:

``` ruby 
[POST] /api/v1/customer

 - Body: 
	 {
  "id":"3"
}
```

RESPONSE:

```json
{
    "data": {
        "id": "3",
        "type": "customer",
        "attributes": {
            "first_name": "Fryce",
            "last_name": "Wein",
            "email": "Fryce.wein@gmail.com",
            "address": "816 Shetland Drive Chesapeake Va 23322"
        },
        "relationships": {
            "subscriptions": {
                "data": []
            }
        }
    }
}
```
---

**All Customers**

- This endpoint finds an existing user, based on user id

``` ruby
[GET] /api/v1/customers

```



 Example:

``` ruby 
[POST] /api/v1/customers

```

RESPONSE:

```json
{
    "data": [
        {
            "id": "1",
            "type": "customer",
            "attributes": {
                "first_name": "Bryce",
                "last_name": "Wein",
                "email": "bryce.wein@gmail.com",
                "address": "816 Shetland Drive Chesapeake Va 23322"
            },
            "relationships": {
                "subscriptions": {
                    "data": []
                }
            }
        }
    ]
}
```
---



# Teas


**Create Tea**

- This endpoint creates a tea
	

``` ruby
[POST] /api/v1/teas


Required BODY: 
 - {"title": "Black Tea",
"description": "super hype goodness",
"brew_details": "Steep in 45 ml of medium high temp water for 15 minutes"}
```

 Example:

``` ruby 
[POST] /api/v1/teas

 - Body: 
	 {"title": "Black Tea",
"description": "super hype goodness",
"brew_details": "Steep in 45 ml of medium high temp water for 15 minutes"}
```

RESPONSE:

```json
{
    "data": {
        "id": "4",
        "type": "tea",
        "attributes": {
            "title": "Black Tea",
            "description": "super hype goodness",
            "brew_details": "Steep in 45 ml of medium high temp water for 15 minutes"
        }
    }
}
```
---


**See all Teas**

- This endpoint returns all the teas 
	

``` ruby
[GET] /api/v1/teas
```


RESPONSE:

```json
{
    "data": [
        {
            "id": "4",
            "type": "tea",
            "attributes": {
                "title": "Black Tea",
                "description": "super hype goodness",
                "brew_details": "Steep in 45 ml of medium high temp water for 15 minutes"
            }
        }
    ]
}
```
---

# Subscription


**Create Subscription**

- This endpoint creates a subscription for a customer
	

``` ruby
[POST]  /api/v1/subscribe


Required Body: 
  {"frequency": "30",
"customer_id": "1",
"tea_id": "4"}
```

 Example:

``` ruby 
[POST]   /api/v1/subscribe

 - Body: 
	   {"frequency": "30",
"customer_id": "1",
"tea_id": "4"}
```

RESPONSE:

```json
{
    "data": {
        "id": "4",
        "type": "subscription",
        "attributes": {
            "active": "Active",
            "frequency": 30,
            "customer_id": 1,
            "tea_id": 4
        }
    }
}
```
---


**Unsubscribe**

- This endpoint unsubscribes a customer from a subscription
	

``` ruby
[GET] /api/v1/unsubscribe

Required Body: 
  {"id": "4"}
```

RESPONSE:

```json
{
    "data": {
        "id": "4",
        "type": "subscription",
        "attributes": {
            "active": "Inactive",
            "frequency": 30,
            "customer_id": 1,
            "tea_id": 4
        }
    }
}
```
---



# Feel like contributing??



![Screen Shot 2022-09-21 at 12 46 48 PM](https://user-images.githubusercontent.com/85247765/191563814-b85ea42e-2070-4333-ae45-579b1de9c153.png)


## Installation

1. Clone this directory to your local repository using the SSH key:

```

$ git clone git@github.com:bwbolt/tea_me.git

```

  

2. Install gems for development using [Bundler](https://bundler.io/guides/using_bundler_in_applications.html#getting-started---installing-bundler-and-bundle-init):

```

$ bundle install

```

  

3. Set up your database with:

```

$ rails db:{drop,create,migrate,seed}

```

  

4. Run the test suite with:

```

$ bundle exec rspec

```

  

5. Run your development server with:

```

$ rails s

```

  

6. In your browser, visit ['localhost:3000/`](http://localhost:3000/) to see the app in action.

7. Contribute away!


![ScreenShot](https://media1.giphy.com/media/l3E6z6QxD2uKoRTDq/giphy.gif?cid=ecf05e47o1mzgsf1ssz1ovbc62vz9k7pm0xiuot6kqhwfqex&rid=giphy.gif&ct=g) 
