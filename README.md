# _EPICODUS INDEPENDENT PROJECT | Shoe Distribution_

#### _Shoe Distribution, 22 July 2016_

#### By _**Lauren Posey**_

## Description

_An application to help shoe distributor keep track of brands are at what stores and vice versa._

## Specifications
#### User Stories:
* _As a user, I want to be able to add, update, delete and list shoe stores._
* _As a user, I want to be able to add shoe brands in the application (no updating, listing or destroying  brands)._
* _As a user, I want to be able to add shoe brands to a store to show where they are sold._
* _As a user, I want to be able to see all of the brands a store sells on the individual store page._
* _As a user, I want store names and shoe brands to be saved with a capital letter no matter how I enter them._
* _As a user, I do not want stores and shoes to be saved if I enter a blank name._

#### RESTful Routing:

Behavior  | Route | Method | Process
------------- | ------------- | ------------- | -------------
Homepage | / | GET | User requests page. Server renders template.
List all stores | /stores | GET | User requests page. Server collects all stores and returns page to display them.
Show single instance of store| /:id | GET | User requests single instance of store. Server uses store id to find it and returns a page to display the selected store
New store form | /stores/new | GET | User requests to add store. Server returns a page with a form that will let the user add a store
Create store when form is submitted | /stores | POST | User submits the form. The server grabs the attributes submitted through the form and uses them to create a new object. The server returns the store page with the new store displayed.
Update a store form | /stores/:id/edit | GET | User requests to update store. Server returns the page with a form that will let the user update the store.
Update database when store edit form is submitted | /stores/:id | PATCH | User submits the form. The server grabs the attributes submitted through the form and uses them to update the store with the id in the URL. The server returns the store page.
Delete the store resource from the database | /stores/:id | DELETE | User submits a delete form. Server grabs the id for the store from the params and found in the URL, finds the store with the matching id and destroys it in the database
New brand form | /brands/new | GET | User requests to add brand. Server returns a page with a form that will let the user add a brand
Create brand when form is submitted | /brands/new | POST | User submits the form. The server grabs the attributes submitted through the form and uses them to create a new object. The server returns the index page with the new brand displayed on add store form.

## Setup/Installation Requirements

* _Clone or download this repository_
* _In terminal run $ bundle_
* _In second terminal window run $ postgres_
* _In first terminal window run $rake db:create_
* _In first terminal window run $rake db:migrate_
* _In first terminal window run $rake db:test:prepare_
* _In terminal run $ ruby app.rb_

## Known Bugs
_PROJECT INCOMPLETE_

* _No integration specs_
* _Doesn't save with a capital letter_
* _No validation for empty inout forms_

## Support and contact details

_If you run into any issues or have questions, ideas, or concerns, please feel free to contact Lauren at <a href="mailto:mrslaurenposey@gmail.com">mrslaurenposey@gmail.com</a>._

## Technologies Used

* _Ruby_
* _Sinatra_

### License

*MIT License*

Copyright (c) 2016 **_Lauren Posey_**

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
