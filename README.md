# Cards app

Cards app is a flashcards application, that allow users to easily create and share collections with others. study collection cards using different types of algorithms.

 

#### Tecnology

---

- [Ruby 3.2.1](https://www.ruby-lang.org/)
- [Rails 7](https://rubyonrails.org)
- [Hotwire](https://hotwired.dev)
- [bulma-css](https://bulma.io)



#### Gems

---

- Authentication
  - [devise](https://github.com/heartcombo/devise)
- Authorization
  - [pundit]()

- Search
  - [ransack](https://github.com/activerecord-hackery/ransack)

- Enums
  - [enumerate_it](https://github.com/lucascaton/enumerate_it)
- Pagination
  - [pagy](https://github.com/ddnexus/pagy)
- Tests
  - [rspec-rails](https://rubygems.org/gems/rspec-rails)
  - [factory-bot-rails](https://github.com/thoughtbot/factory_bot_rails)
  - [shoula-matcher](https://github.com/thoughtbot/shoulda-matchers)
- Debug
  - [letter-opener](https://github.com/ryanb/letter_opener)
  - [bullet](https://github.com/flyerhzm/bullet')



####  Setup

---

```bash
# install depedencies
bundle install

# run migrations
rails db:migrate

# seed database
rails db:seed

# base user credential
# email: user@email.com
# password: 123456
```



#### Testing the application

---

```bash
# run tests
rspec
```

