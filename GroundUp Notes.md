#Controller 

- Home Page and index (**Done**)

```
$ rails g controller Homepage index
```

- All Services Page and index for each (Need List of Services)

```
$ rails g scaffold Services name info:text pictures

$ rails db:migrate
```

#Carrierwave for Pictures in Services (Done)

```Ruby
gem 'carrierwave'
```

and bundle install.

```
$ rails g uploader Pictures
```



#Model

- Testimonials Page (**Done**)
   - user reviews/comments stored in DB and posted on page

```
$ rails g scaffold Testimonials content:text user_id:integer

$ rails db:migrate
```

- Contact Page (**Done**)
   - form for user to enter info and then stored into DB

```
$ rails g model Contact name email phone_number:integer

$ rails db:migrate
```



#Devise

Add to Gemfile: Other gems added too… (**Done**)

```ruby
gem 'devise'
gem 'bootstrap-sass'
gem 'jquery-rails'
gem 'font-awesome-rails'
```

in application.js add: (**Done**)

```
//= require jquery

//= require jquery_ujs

//= require bootstrap-sprockets

#above turbolinks
```

Then: (**Done**

```
// application.css
// becomes application.scss
// and we add:

@import "bootstrap-sprockets";
@import "bootstrap";
@import "font-awesome";
```

Then: (**Done**)

```
$ bundle install
```

Some gems are ready to go after a bundle install.

Others need you to do a little more...

In your Terminal/Command Prompt run: (**Done**)

```
$ rails g devise:install
```

#User 

- form for log in (**Done**)

```
$ rails g devise User

$ rails db:migrate
```

Next add username to User (**Done**)

```
$ rails g migration AddUsernameToUser username:string

$ rails db:migrate
```

in testimonials_controller.rb

Add username to params: (**Done**)

```ruby
    def testimonial_params
      params.require(:testimonial).permit(:content, 			:user_id, :username)
    end
```



## Put Devise to Work

in application_controller.rb (**Done**)

```ruby
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
```

Then add this to testimonials_controller.rb (**Done**)

```ruby
before_action :authenticate_user!, only: [:index, :show]
```

Now if anyone wants to make a testimonial, they'll need to sign up, and sign in, first!

# Navbar Partial

Created _navbar.html.erb in views/layouts

Then rendered the navbar in application.html.erb in views/layouts

```html
<%= render 'layouts/navbar' %>

```

# Navbar

Altered the navbar from ecommerce to fit GroundUp project.

Added:

- Home


- Testimonials
- Services (dropdown)
- Contact Us
- Log In

# Carousel

in views/services/show.html.erb:

Added a carousel under the **edit** and **back** links

```html
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
  	<% @post.pictures.each_with_index do |pic, index| %>
  	<% if index == 0 %>
    	<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <% else %>
    	<li data-target="#carousel-example-generic" data-slide-to="<%= index %>"></li>
    <% end %>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
  	<% @post.pictures.each_with_index do |pic, index| %>
  	<% if index == 0 %>
    	<div class="item active">
    <% else %>
    	<div class="item">
    <% end %>

      <%= image_tag pic.url %>
    </div>
    <% end %>

  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
```



# CanCanCan

Add to Gemfile:

```ruby
gem 'cancancan'
```

```
$ bundle install
```

Then:

```
$ rails g cancan:ability
$ rails g migration AddRoleToUser role
$ rails db:migrate
```





# To Do List

- Add Homepage content and upload logo
- figure out how to upload pictures to the homepage







