[![CI](https://github.com/javier-menendez/sprockets_terser_with_source_maps/actions/workflows/ci.yml/badge.svg)](https://github.com/javier-menendez/sprockets_terser_with_source_maps/actions/workflows/ci.yml)

# SprocketsTerserWithSourceMaps

Create source maps when compressing assets in your Rails applications.

This gem uses Terser to create source maps for your concatenated javascripts in Rails.
It is meant to be used as a replacement for javascript compressor.

This gem is ported from [sprockets_uglifier_with_source_maps](https://github.com/AlexanderPavlenko/sprockets_uglifier_with_source_maps)
to generate source maps using terser as compressor.

Rails versions supported: 4.2, 5.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sprockets_terser_with_source_maps'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install sprockets_terser_with_source_maps

## Usage

In your Rails applications environment configuration:

    config.assets.js_compressor = :terser_with_source_maps

If you need to pass options to terser:

    config.assets.terser = {output: {beautify: true, indent_level: 2}, compress: {drop_console: true}}

Your assets will be built as normal, also maps and concatenated sources will be provided as well in `public/assets/maps` and `public/assets/sources`.
These subdirs may be configured:

    config.assets.sourcemaps_prefix = 'my_maps'
    config.assets.uncompressed_prefix = 'my_sources'

Alternatively, sources can be embedded into sourcemaps' `sourcesContent` field:

    config.assets.sourcemaps_embed_source = true

You can optionally skip gzipping your maps and sources:

    config.assets.sourcemaps_gzip = false

By default maps and sources are defined relatively and will be fetched from the same domain your js file is served from. If you are using a CDN you may not want this - instead you might want to use a direct link to your site so you can more easily implement IP or Basic Auth protection:

    # set to a url - js will be served from 'http://cdn.host.com' but source map links will use 'http://some.host.com/'

    config.assets.sourcemaps_url_root = 'http://some.host.com/'

If you use CloudFront you might want to generate a signed url for these files that limits access based on IP address. You can do that by setting sourcemaps_url_root to a Proc and handling your URL signing there:

    # using a Proc - see the AWS SDK docs for everything required to make this work
    config.assets.sourcemaps_url_root = Proc.new { |file| MyApp.generate_a_signed_url_for file }

## Example

    $ rm -rf tmp/cache && rm -rf public/assets && DISABLE_SPRING=true RAILS_ENV=production bin/rake assets:precompile

    $ tree public/assets
    public/assets
    ├── application-f925f01bc55e9831029c1eb2c20ee889.js
    ├── maps
    │   └── application-a3aff92c860f3876615c2d158f724865.js.map
    └── sources
        └── application-73a007cf2d51c423a4420b649344b52e.js

    $ tail -n1 public/assets/application-f925f01bc55e9831029c1eb2c20ee889.js
    //# sourceMappingURL=/assets/maps/application-a3aff92c860f3876615c2d158f724865.js.map

    $ head -c115 public/assets/maps/application-a3aff92c860f3876615c2d158f724865.js.map
    {"version":3,"file":"application.js","sources":["/assets/sources/application-73a007cf2d51c423a4420b649344b52e.js"],

## Troubleshooting

If sourcemaps are not generated, try `rm -rf tmp/cache`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sprockets_terser_with_source_maps. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/sprockets_terser_with_source_maps/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SprocketsTerserWithSourceMaps project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/sprockets_terser_with_source_maps/blob/master/CODE_OF_CONDUCT.md).
