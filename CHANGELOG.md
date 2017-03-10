# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.11.0] - 2017-03-10
### Changed
- Typhoeus removed in favour of Net::HTTP

### Added
- webmock for testing

### Fixed
- problems with 0 as response code caused by Typhoeus
- [#9](https://github.com/ucetnictvi-on-line/pina/issues/9) Doesn't raise expeception when connection is refused by Fantozzi server
- [#10](https://github.com/ucetnictvi-on-line/pina/issues/10) Implement Faraday gem (implemented net::HTTP instead)

