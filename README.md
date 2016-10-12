# Pina

[![Gem Version](https://badge.fury.io/rb/pina.png)](http://badge.fury.io/rb/pina)
[![Build Status](https://travis-ci.org/ucetnictvi-on-line/pina.png?branch=master)](https://travis-ci.org/ucetnictvi-on-line/pina)
[![Dependency Status](https://gemnasium.com/ucetnictvi-on-line/pina.svg)](https://gemnasium.com/ucetnictvi-on-line/pina)
[![Code Climate](https://codeclimate.com/github/ucetnictvi-on-line/pina/badges/gpa.svg)](https://codeclimate.com/github/ucetnictvi-on-line/pina)
[![Test Coverage](https://codeclimate.com/github/ucetnictvi-on-line/pina/badges/coverage.svg)](https://codeclimate.com/github/ucetnictvi-on-line/pina)


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

### Contacts

#### All contacts

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

#### Fetching specific contact

```ruby
Pina::Contact.find('contact_name')
```

#### Create new contact

```ruby
contact = Pina::Models::Contact.new
Pina::Contact.create(contact)
```

#### Update existing contact

```ruby
contact = Pina::Contact.find('existing')
contact.email = 'brand_new@email.com'
Pina::Contact.update('existing', contact)
```

### Sales Invoices

#### All sales invoices

```ruby
Pina::SalesInvoice.all
```

Gets all sales invocies from your database. Results are paginated and you can access
first, next or previous page like this:

```ruby
invoices = Pina::SalesInvoice.all
invoices.next_page
```

```ruby
invoices = Pina::SalesInvoice.all
invoices.previous_page

invoices.first_page
```

#### Fetching specific sales invoice

```ruby
Pina::SalesInvoice.find(invoice_id)
```

#### Create new sales invoice

```ruby
invoice = Pina::Models::SalesInvoice.new
Pina::SalesInvoice.create(invoice)
```

#### Update existing sales invoice

```ruby
invoice = Pina::SalesInvoice.find(2016000001)
invoice.status = :confirmed
Pina::SalesInvoice.update(2016000001, invoice)
```

### Sales Orders

#### All sales orders

```ruby
Pina::SalesOrder.all
```

Gets all sales orders from your database. Results are paginated and you can access
first, next or previous page like this:

```ruby
orders = Pina::SalesOrder.all
orders.next_page
```

```ruby
orders = Pina::SalesOrder.all
orders.previous_page

orders.first_page
```

#### Fetching specific sales order

```ruby
Pina::SalesOrder.find(order_id)
```

### Receivables

#### All receivables

```ruby
Pina::Receivable.all
```

Gets all receivables from your database. Results are paginated and you can access
first, next or previous page like this:

```ruby
receivables = Pina::Receivable.all
receivables.next_page
```

```ruby
invoices = Pina::Receivable.all
invoices.previous_page

invoices.first_page
```

#### Fetching specific receivable

```ruby
Pina::Receivable.find(invoice_id)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing

Create .env file with following variables in it:
```
EMAIL
TENANT
API_TOKEN
```
and fill them with appropriate values.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pina.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

