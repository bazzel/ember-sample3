# Single Page App using Ember.js

This application is another a personal exercise to get familiar with
[ember.js](http://emberjs.com/) and is inspired by several guides, tutorials and articles.

The application shows a table of Post objects which you can edit and show. It's also possible to create new Post objects.
Every Post contain 0 or more Comments and Backtracks which are visible on the show page to play with ember's nested routes.

The application uses a [Rails 3.2.x](http://rubyonrails.org/) back-end and contains a generator to get you up and running.

I'm using [Ember Data](https://github.com/emberjs/data) to retrieve data from the server.

# Getting Started
1. Clone this repo

 `git clone https://github.com/bazzel/ember-sample3.git single_page`
2. Navigate to the application directory

 `cd single_page `
3. Install the gems

 `bundle install`
4. Create the (SQLite) database

 `rake db:create`
5. Run the migrations

 `rake db:migrate`
6. Populate the database

 `rake db:seed`
7. Start the server

 `rails s`
8. Open a browser and navigate to http://localhost:3000

# More info
## Location of JS files
Although the application uses the [ember-rails](https://github.com/emberjs/ember-rails) gem, it only uses it for pre-compiling the handlebars templates.
The required JS files for ember and ember data are built manually and located in **vendor/assets/javascript**.
Application logic is located in **app/assets/javascripts** (this is the suggested location according to Rails' [assets pipeline](http://guides.rubyonrails.org/asset_pipeline.html)).

## What's included
- [Zurb Foundation 3](http://foundation.zurb.com/)
- ember.js router and some nested routes
- transaction usage (commit and rollback)
- [Mark active menu item using router
infrastructure](http://stackoverflow.com/questions/11628489/emberjs-how-to-mark-active-menu-item-using-router-infrastructure)
- Populate a select HTML element with server side data
- Display data in [modal
window](http://foundation.zurb.com/docs/reveal.php)
- Using didInsertElement hook to initialize jQuery plugins.
- Use classNameBindings and classNames to display a [nice alert
box](http://foundation.zurb.com/docs/elements.php).


## What's not included
- Tests (it's only a prototype :))
- Client side validation
- Flash notification
- ...

