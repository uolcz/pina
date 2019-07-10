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

## Docker dev setup
To open development environment in docker:
1) install prerequisites
`gem install docker-sync`
2) run
```sh
docker volume create --name=gem_store_235
docker-sync start
docker-compose run web bash
```

## Fantozzi API coverage
| Resource                | All   | Find  | Find_by | Where | Create | Update | Delete |
| ----------------------- | :---: | :---: | :-----: | :---: | :-----:| :----: | :----: |
| Contacts                | o     | o     | o       | o     | o      | o      | -      |
| MyBankAccount           | o     | o     | -       | o     | o      | o      | -      |
| PettyCashDisburstment   | o     | -     | -       | -     | -      | -      | -      |
| ProcessedDocument       | o     | o     | -       | o     | -      | -      | o      |
| PurchaseInvoice         | o     | o     | -       | o     | o      | o      | -      |
| Receivable              | o     | o     | -       | o     | -      | -      | -      |
| SalesInvoice            | o     | o     | -       | o     | o      | o      | -      |
| SalesOrder              | o     | o     | -       | o     | -      | -      | -      |
| StatProcessedDocument   | o     | o     | -       | o     | -      | -      | -      |
| UploadedDocument        | o     | o     | -       | o     | o      | o      | -      |
| UploadedDocumentPairing | -     | -     | -       | -     | o      | -      | -      |

Resources not mentioned = resources not covered.

## Usage

Before you start using Pina you have to configure it.

```ruby
Pina.configure do |config|
  config.email      = 'your_email@domain.com'
  config.tenant     = 'your tenant database name'
  config.api_token  = 'your secret token'
end
```

Optionally, you can configure Pina to run against other than production instance of Fantozzi:
```ruby
Pina.configure do |config|
  config.api_host = 'localhost:3000'
  config.use_ssl  =  true | false   # defaults to true
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

### Petty Cash Disburstments

#### All petty cash disburstments
```ruby
Pina::PettyCashDisburstment.all
```

### Processed Documents

#### All processed documents

```ruby
Pina::ProcessedDocument.all
```

Gets all processed documents from your database. Results are paginated and you can access
first, next or previous page like this:

```ruby
documents = Pina::ProcessedDocument.all
documents.next_page
```

```ruby
documents = Pina::ProcessedDocument.all
documents.previous_page

documents.first_page
```

#### Fetching specific processed document

```ruby
Pina::ProcessedDocument.find(gid)
```

#### Deleting specific processed document

```ruby
Pina::ProcessedDocument.delete(gid)
```

### Purchase Invoices

#### All purchase invoices

```ruby
Pina::PurchaseInvoice.all
```

Gets all purchase invocies from your database. Results are paginated and you can access
first, next or previous page like this:

```ruby
invoices = Pina::PurchaseInvoice.all
invoices.next_page
```

```ruby
invoices = Pina::PurchaseInvoice.all
invoices.previous_page

invoices.first_page
```

#### Fetching specific purchase invoice

```ruby
Pina::PurchaseInvoice.find(invoice_id)
```

#### Create new purchase invoice

```ruby
invoice = Pina::Models::PurchaseInvoice.new
Pina::PurchaseInvoice.create(invoice)
```

#### Update existing purchase invoice

```ruby
invoice = Pina::PurchaseInvoice.find(2016000001)
invoice.type = :penalty
Pina::PurchaseInvoice.update(2016000001, invoice)
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

### Stat Processed Documents

#### All stat processed documents

```ruby
Pina::StatProcessedDocument.all
```

Gets all stat processed documents from your database. Results are paginated and you can access
first, next or previous page like this:

```ruby
stats = Pina::StatProcessedDocument.all
stats.next_page
```

```ruby
stats = Pina::StatProcessedDocument.all
stats.previous_page

stats.first_page
```

#### Fetching specific stat processed document

```ruby
Pina::StatProcessedDocument.find(gid)
```

### MyBankAccounts

#### All my bank accoutns

```ruby
Pina::MyBankAccount.all
```

Gets all bank accounts from your database. Results are paginated and you can access
first, next or previous page like this:

```ruby
bank_accounts = Pina::MyBankAccount.all
bank_accounts.next_page
```

```ruby
bank_accounts = Pina::MyBankAccount.all
bank_accounts.previous_page

bank_accounts.first_page
```

#### Fetching specific bank account

```ruby
Pina::MyBankAccount.find('csob_czk')
```

This ID you can find under attribute `bank_account_id`


#### Create new MyBankAccount

```ruby
params = {
  bank_account: 'XXXXXXXXX/XXXX',
  currency_id: 'CZK',
  bank_account_id: 'XXXX'
}

bank_account = Pina::Models::MyBankAccount.new(params)
Pina::MyBankAccount.create(bank_account)
```

#### Update existing bank account

```ruby
bank_account = Pina::MyBankAccount.find('existing')
bank_account.download_type = 'none'
Pina::MyBankAccount.update('existing', bank_account)
```

### UploadedDocuments

#### All Uploaded documents

```ruby
Pina::UploadedDocument.all
```

Gets all uploaded documents from your database. Results are paginated and you can access
first, next or previous page like this:

```ruby
uploaded_documents = Pina::UploadedDocument.all
uploaded_documents.next_page
```

```ruby
uploaded_documents = Pina::UploadedDocument.all
uploaded_documents.previous_page

uploaded_documents.first_page
```

#### Fetching specific uploaded document (by ID)

```ruby
Pina::UploadedDocument.find(1)
```

#### Update existing uploaded document

```ruby
uploaded_document = Pina::UploadedDocument.find(1)
uploaded_document.state = 'processed'
Pina::UploadedDocument.update(1, uploaded_document)
```
### UploadedDocumentPairing
#### Pair uploaded document with a book-keeping document
```ruby
Pina::UploadedDocumentPairing.create(uploaded_document_id: 1,
                                     document_pairable_type: 'purchase_invoice',
                                     document_pairable_id: 201700001)
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

