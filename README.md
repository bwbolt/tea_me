

# API Usage
- Base URL:     `http://localhost:3000`


- Available Endpoints:
  - [Customer Endpoints](#CUSTOMER)





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


**Find User**

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



# Garden


**Create Garden**

- This endpoint creates a garden for a user 
	

``` ruby
[POST] /api/v1/users/:id/gardens


Required PARAMS: 
 - _json: user_data.to_json
```

 Example:

``` ruby 
[POST] /api/v1/users/:id/gardens

 - Params: 
	 - _json : "{\"user_id\":1,\"name\":\"Summer Garden\",\"notes\":\"it's too damn hot\",\"cardinal_direction\":1}"
```

RESPONSE:

```json
{
	"data": {
		"id": "2",
		"type": "garden",
		"attributes": {
			"name": "Summer Garden",
			"cardinal_direction": "South",
			"notes": "it's too damn hot"
		}
	}
}
```
---


**User Gardens**

- This endpoint returns all the gardens for a user
	

``` ruby
[GET] /api/v1/users/:user_id/gardens
```


RESPONSE:

```json
{
	"data": [
		{
			"id": "1",
			"type": "garden",
			"attributes": {
				"name": "Summer Garden",
				"cardinal_direction": "South",
				"notes": "it's too damn hot"
			}
		},
		{
			"id": "2",
			"type": "garden",
			"attributes": {
				"name": "Summer Garden",
				"cardinal_direction": "South",
				"notes": "it's too damn hot"
			}
		}
	]
}
```
---

**Garden Show**

- This endpoint returns a particular garden
	

``` ruby
[GET] /api/v1/users/:user_id/gardens
```


RESPONSE:

```json
{
	"data": {
		"id": "2",
		"type": "garden",
		"attributes": {
			"name": "Summer Garden",
			"cardinal_direction": "South",
			"notes": "it's too damn hot"
		}
	}
}
```
---
**Garden Destroy**

- This endpoint destroys a particular garden
	

``` ruby
[DELETE] /api/v1/users/:user_id/gardens/:id
```


RESPONSE:

```json
No Response
```
---
**Garden Update**

- This endpoint updates a particular garden
	

``` ruby
[PATCH] /api/v1/users/:user_id/gardens/:id
```

 Example:

``` ruby 
[PATCH] /api/v1/users/:user_id/gardens/:id


 - Params: 
	 - _json : "{\"name\":\"Summer Garden\",\"notes\":\"it's too damn hot\",\"cardinal_direction\":1}"
```

RESPONSE:

```json
{
	"data": {
		"id": "2",
		"type": "garden",
		"attributes": {
			"name": "Summer Garden",
			"cardinal_direction": "South",
			"notes": "it's too damn hot"
		}
	}
}
```
---



# Plant


**Create Plant**

- This endpoint creates a garden for a user 
	

``` ruby
[POST]  /api/v1/users/:user_id/gardens/:garden_id/plants


Required PARAMS: 
 - _json: plant_data.to_json
```

 Example:

``` ruby 
[POST]  /api/v1/users/:user_id/gardens/:garden_id/plants

 - Params: 
	 - _json: "{\"user_id\":\"1\",\"garden_id\":\"1\",\"name\":\"Carrot\",\"plant_id\":\"sae2340987dage\"}"
```

RESPONSE:

```json
{
	"data": {
		"id": "2",
		"type": "plant",
		"attributes": {
			"name": "Carrot",
			"plant_id": "sae2340987dage",
			"date_planted": null,
			"moon_phase": null,
			"date_matured": null,
			"bounty_amount": null,
			"pruning_behaviors": null,
			"notes": null,
			"garden_id": 1
		}
	}
}
```
---


**Garden Plants**

- This endpoint returns all the plants for a garden
	

``` ruby
[GET] /api/v1/users/:user_id/gardens/:garden_id/plants
```

RESPONSE:

```json
{
	"data": [
		{
			"id": "1",
			"type": "plant",
			"attributes": {
				"name": "Carrot",
				"plant_id": "sae2340987dage",
				"date_planted": null,
				"moon_phase": null,
				"date_matured": null,
				"bounty_amount": null,
				"pruning_behaviors": null,
				"notes": null,
				"garden_id": 1
			}
		},
		{
			"id": "2",
			"type": "plant",
			"attributes": {
				"name": "Carrot",
				"plant_id": "sae2340987dage",
				"date_planted": null,
				"moon_phase": null,
				"date_matured": null,
				"bounty_amount": null,
				"pruning_behaviors": null,
				"notes": null,
				"garden_id": 1
			}
		}
	]

}
```
---

**Plant Show**

- This endpoint returns a particular plant
	

``` ruby
[GET] /api/v1/users/:user_id/gardens/:garden_id/plants/:id
```

RESPONSE:

```json
{
	"data": {
		"id": "2",
		"type": "plant",
		"attributes": {
			"name": "Carrot",
			"plant_id": "sae2340987dage",
			"date_planted": null,
			"moon_phase": null,
			"date_matured": null,
			"bounty_amount": null,
			"pruning_behaviors": null,
			"notes": null,
			"garden_id": 1
		}
	}
}
```
---
**Plant Destroy**

- This endpoint destroys a particular plant
	

``` ruby
[DELETE] /api/v1/users/:user_id/gardens/:garden_id/plants/:id
```

RESPONSE:

```json
No Response
```
---
**Plant Update**

- This endpoint updates a particular plant
	

``` ruby
[PATCH] /api/v1/users/:user_id/gardens/:garden_id/plants/:id
```

 Example:

``` ruby 
[PATCH] /api/v1/users/:user_id/gardens/:garden_id/plants/:id


 - Params: 
	 - _json : "{\"moon_phase\":\"Full\"}"
```

RESPONSE:

```json
{
	"data": {
		"id": "2",
		"type": "plant",
		"attributes": {
			"name": "Carrot",
			"plant_id": "sae2340987dage",
			"date_planted": null,
			"moon_phase": "Full",
			"date_matured": null,
			"bounty_amount": null,
			"pruning_behaviors": null,
			"notes": null,
			"garden_id": 1
		}
	}
}
```
---

# Feel like contributing??



<img src="https://user-images.githubusercontent.com/85247765/182939845-58e20d6b-c710-4fc5-8ea3-c4345f38025d.png" width="600" height="300">
Note: "plant_id" in the plant table is referencing the id from an outside api.



## Installation

1. Clone this directory to your local repository using the SSH key:

```

$ git clone git@github.com:Moon-Garden/moon_garden_be.git

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
