![Build CI](https://img.shields.io/github/workflow/status/kuon/ruby-base24/Ruby)
![License](https://img.shields.io/badge/license-Apache%202.0/MIT-0b398e)
![Version](https://img.shields.io/gem/v/base24)



# Base24

An encoder/decoder for
[base24 binary-to-text encoding](https://www.kuon.ch/post/2020-02-27-base24/)
for Ruby.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'base24'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install base24

## Usage

```ruby
# Encode some bytes (bytes are strings)
bytes = Random.new.bytes(4)
str = Base24.encode24(bytes)
decoded_bytes = Base24.decode24(str)

decoded_bytes == bytes # is true

Base24.encode24([0x88, 0x55, 0x33, 0x11].pack('C*')) == "5YEATXA" # is true
```

## License

Licensed under either of

 * Apache License, Version 2.0
   ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
 * MIT license
   ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)

at your option.

## Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license, shall be
dual licensed as above, without any additional terms or conditions.

