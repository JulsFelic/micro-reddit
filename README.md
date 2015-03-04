# The [Micro-Reddit](http://www.theodinproject.com/ruby-on-rails/building-with-active-record) project from [The Odin Project](http://www.theodingproject.com).

The goal of this project was to have you think through what data structures where needed to implement a very simple command line version of [Reddit](http://reddit.com). This involved figuring out what *Models* were neccessary along with the associated *relationships* between the corresponding Models. I'll quickly go over some of the important parts that helped build the final implementation.

## The Required Models

After reading the requirements spec from [TOP](http://theodinproject.com), I concluded that 3 Models were needed. A **User**, **Post** and **Comment** model. With that out of the way, I began to map out on paper the required attributes along with any validations and relationships that would be needed. This really helps set you up for when you start apply the Models into code. If you run into a snag, just pull up your notes and see where the hang up is. Here is an example of how I went about mapping out the **User** model on paper:

```
Table: users

Attributes:
  username:string [length, presence]
  email:string [presence, uniqueness, format], index

  has_many :posts
  has_many :comments
```

Since *Rails* automatically includes the ```id``` and ```created_at``` and ```updated_at``` columns, they are ommited from the paper representation. Once you have all your Models sketched out, then you can use the Rails generators to create them like so:

```
  $ rails generate model User username:string email:string:index
```

It is convention in Rails to provide the ```generate model``` the name of your in a singular format. This will create the files needed for the Model, most importantly the migration file which can be found at ```db/migrate/timestamp_create_model_name.rb``` and the Model itself found at ```app/models/model_name.rb```. At this point we can run the migration files with the command ```$ bundle exec rake db:migrate``` and this will set up our database with the tables needed for our models. From this point we can now set up our relationship between the models.

## Relationships and Your Models
