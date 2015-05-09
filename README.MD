John Young Program name: Hair Salon App

Description: This app allows users to input a Stylists and also Clients. From the index page the user selects Stylists from that page the user can add a new Stylist or veiw current one. If the user veiws a current one they may then add a client by selecting the add client link. Ruby Setup Gems used: Sinatra, Sinatra-contrib, rspec, capybara, pg and pry. Bundler must be installed.

The database used is "hair_salon" and the test database is "hair_salon_test".
 
The tables used are "stylists" (id serial PRIMARY KEY, stylist varchar) and "clients" (id serial PRIMARY KEY, name varchar, stylist_id int)

Copying/license: The MIT License (MIT)

Copyright (c) 2015 John Young

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.