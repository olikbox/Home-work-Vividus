#Create API tests for the following scenarios:
#Use public API Swagger for Pets Store >> https://petstore.swagger.io/#/

Lifecycle:
Examples:
{transformer=FROM_LANDSCAPE}
|id          |#{generate(Number.numberBetween '1','100')}	|
|email       |#{generate(Internet.emailAddress)}			|
|firstName   |#{generate(Name.firstName)}					|
|lastName    |#{generate(Name.lastName)}					|
|password    |#{generate(Internet.password)}				|
|username    |#{generate(Name.username)}					|
|phone       |#{generate(Number.digits '10')}				|
|petId       |#{generate(Number.numberBetween '1','100')}	|



Scenario: 1. Verify that allows creating a User
When I set request headers:
|name                        |value            |
|Content-Type                |application/json |
Given request body:
{
   "id": <id>,
   "username": "<username>",
   "firstName": "<firstName>",
   "lastName": "<lastName>",
   "email": "<email>",
   "password": "<password>",
   "phone": "<phone>",
   "userStatus": 3
}

When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/user`
Then response code is equal to `200`





Scenario: 2. Verify that allows login as a User
When I execute HTTP GET request for resource with URL `https://petstore.swagger.io/v2/user/login?username=<username>&password=<password>`
When I set request headers:
|name                        |value            |
|Content-Type                |application/json |
Then response code is equal to `200`





Scenario: 3. Verify that allows creating the list of Users
Given request body:
[
    {
    "id": <id>,
   "username": "<username>",
   "firstName": "<firstName>",
   "lastName": "<lastName>",
   "email": "<email>",
   "password": "<password>",
   "phone": "<phone>",
   "userStatus": 5
    },
    {
    "id": <id>,
   "username": "<username>",
   "firstName": "<firstName>",
   "lastName": "<lastName>",
   "email": "<email>",
   "password": "<password>",
   "phone": "<phone>",
   "userStatus": 8
    }
]
When I set request headers:
|name                        |value            |
|Content-Type                |application/json |
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/user/createWithList`

Then response code is equal to `200`







Scenario: 4. Verify that allows Log out User
When I execute HTTP GET request for resource with URL `https://petstore.swagger.io/v2/user/logout`
When I set request headers:
|name                        |value            |
|Content-Type                |application/json |
Then response code is equal to `200`






Scenario: 5. Verify that allows adding a new Pet
Given request body:
{
   "id": <petId>,
   "category": {
       "id": 10,
       "name": "HomePet"
   },
   "name": "Puff",
   "photoUrls": ["image"],
   "tags": [
       {
           "id": 10,
           "name": "little"
       }
   ],
   "status": "free"
}
When I set request headers:
|name                        |value            |
|Content-Type                |application/json |
When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/pet`

Then response code is equal to `200`






Scenario: 6 Verify that allows updating Pet’s image
Given multipart request:
|name    |type   |value                          |contentType           |
|file    |file   |/pictures/image.jpeg|multipart/form-data; boundary=---|

When I execute HTTP POST request for resource with URL `https://petstore.swagger.io/v2/pet/${petId}/uploadImage`

Then response code is equal to `200`

Given request body:
{
  "id": ${petId},
  "category": {
    "id": 10,
    "name": "HomePet"
  },
  "name": "Puff",
  "photoUrls": ["image.jpg"],
  "tags": [
    {
      "id": 10,
      "name": "little"
    }
  ],
  "status": "free"
}
When I set request headers:
|name                        |value            |
|Content-Type                |application/json |
When I execute HTTP PUT request for resource with URL `https://petstore.swagger.io/v2/pet`

Then response code is equal to `200`







Scenario: 7. Verify that allows updating Pet’s name and status
Given request body:
{
  "id": ${petId},
  "category": {
    "id": 10,
    "name": "HomePet"
  },
  "name": "Rock",
  "photoUrls": ["image.jpg"],
  "tags": [
    {
      "id": 10,
      "name": "little"
    }
  ],
  "status": "busy"
}
When I set request headers:
|name                        |value            |
|Content-Type                |application/json |

When I execute HTTP PUT request for resource with URL `https://petstore.swagger.io/v2/pet`

Then response code is equal to `200`






Scenario: 8. Verify that allows deleting Pet
When I set request headers:
|name                        |value            |
|Content-Type                |application/json |
When I execute HTTP DELETE request for resource with URL `https://petstore.swagger.io/v2/pet/${petId}`
Then response code is equal to `200`
