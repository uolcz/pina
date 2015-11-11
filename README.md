# Pina

Simple client for Fantozzi REST API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pina'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pina

## Usage

Before you start using Pina you have to configure it.

```ruby
Pina.configure do |config|
  config.email = 'your_email@domain.com'
  config.tenant = 'your tenant database name'
  config.api_token = 'your secret token'
end
```

Now you can start querying REST API.

### All contacts

```ruby
Pina::Contact.all
```

Gets all contacts from your database. Results are paginated and you can access
first, next or previous page like this:

```ruby
contacts = Pina::Contact.all
contacts.next_page
```

```ruby
contacts = Pina::Contact.all
contacts.previous_page

contacts.first_page
```

### Fetching specific contact

```ruby
Pina::Contact.find('contact_name')
```

### Create new contact

```ruby
contact = Pina::Models::Contact.new
Pina::Contact.create(contact)
```

### Update existing contact

```ruby
contact = Pina::Contact.find('existing')
contact.email = 'brand_new@email.com'
Pina::Contact.update('existing', contact)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pina.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

