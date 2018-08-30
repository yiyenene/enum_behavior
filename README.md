# EnumBehavior

EnumBehavior is simple polymorphic behavior with Enum related object and delegation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'enum_behavior'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install enum_behavior

## Usage

1. Add `include EnumBehavior` to your ActiveRecord model class.

```ruby
class Music < ActiveRecord::Base
  include EnumBehavior
end

# You can do this at super class such as ApplicationRecord.
```

2. Add `enum_behavior` after enum declaration.

``` ruby
class Music < ApplicationRecord
  enum genre: { pop: 0, rock: 1, metal: 2 }
  enum_behavior :genre
end
```

3. Define class related enum values

``` ruby
module Musics # Pluralized behavior defined class name
  class Pop < EnumBehavior::Base
    def message
      'Love Musics'
    end
  end

  class Metal
    # you can define plane class instead of using EnumBehavior::Base.
    # Require constructor with 1 argument. (passes related ActiveRecord instance)
    def initialize(model)
      @model = model
    end

    attr_reader :model

    def message
      'Love HeavyMetal!'
    end
  end
end
```

4. Simple polymorphic behavior!

``` ruby
m = Music.new(genre: :pop)
m.genre_behavior.message # => Love Musics

m.genre = :metal
m.genre_behavior.message # => Love HeavyMetal!

m.genre = :rock
m.genre_behavior.message # => NameError uninitialized constant Musics::Rock

# You can use with delegate
# delegate :message, to: :genre_behavior, prefix: :genre
# m.genre_message
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yiyenene/enum_behavior. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EnumBehavior project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/enum_behavior/blob/master/CODE_OF_CONDUCT.md).
