<h1 align="center">
  Pauze
</h1>

<div align="center">
  <h4>
    <a href="https://github.com/Team-Chicken-Nuggets/fydp-backend/commits/main"><img src="https://img.shields.io/github/last-commit/Team-Chicken-Nuggets/fydp-backend"/></a>
    <a href="https://github.com/Team-Chicken-Nuggets/fydp-backend/issues"><img src="https://img.shields.io/github/issues-raw/Team-Chicken-Nuggets/fydp-backend"/></a>
    <a href="https://github.com/Team-Chicken-Nuggets/fydp-backend/pulls"><img src="https://img.shields.io/github/issues-pr/Team-Chicken-Nuggets/fydp-backend"/></a>
</div>
<p><font size="3">
Description here.</p>

# Usage

## Requirements

### Versions
- Ruby 2.7.1
- Rails 6.0.2
- PostgreSQL

## Getting Started

### 1) Setup the database

```bash
rails db:create
rails db:migrate
rails db:seed
```

If you get an error, try `rails db:reset`.

### 2) Install gems

```bash
bundle install
```

### 3) Start the server

```bash
rails server
```
Now you can visit the site with the URL http://localhost:3000


# GraphQL

Test your GraphQL queries at `/graphiql`.

# Continuous Integration

## Testing

This repo uses `rspec` for testing. Learn more about it <a href="https://rspec.info/">here</a>. Tests can be found under `/spec/`. 

### Running Specs

```sh
# Default: Run all spec files
$ bundle exec rspec

# Run all spec files in a single directory (recursively)
$ bundle exec rspec spec/models

# Run a single spec file
$ bundle exec rspec spec/controllers/accounts_controller_spec.rb

# Run a single example from a spec file (by line number)
$ bundle exec rspec spec/controllers/accounts_controller_spec.rb:8

# See all options for running specs
$ bundle exec rspec --help
```

## Linting

This repo uses `rubocop` for linting. Learn more about it <a href="https://rubocop.org/">here</a>.

### Usage
- If you are using VSCode and install `ruby-rubocop` you files will be linted on save.
- Lint all your files with `bundle exec rubocop`
- Lint a specific file with `bundle exec rubocop file`
- Lint several files with `bundle exec rubocop file1 file2 ...`

# Common Problems

