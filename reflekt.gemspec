Gem::Specification.new do |spec|

  spec.name        = 'rowdb'
  spec.version     = '0.1.0'
  spec.date        = '2020-07-23'
  spec.authors     = ["Maedi Prichard"]
  spec.email       = 'maediprichard@gmailcom'

  spec.summary     = "A local JSON database."
  spec.description = "A local JSON database for Ruby inspired by lowdb."
  spec.homepage    = 'https://github.com/maedi/rowdb'
  spec.license     = 'MPL-2.0'

  spec.files         = ["lib/rowdb.rb", "lib/rehash/adapters/FileSystem.rb"]
  spec.require_paths = ["lib"]

  spec.add_dependency "oj"

end