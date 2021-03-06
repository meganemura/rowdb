<p align="center">

  <img src="./Assets/Logo.svg" raw=true width="500" style="margin-left: auto; margin-right: auto;"/>

</p>
<p align="center">

  <a href="https://www.mozilla.org/MPL/2.0/" alt="MPLv2 License">
    <img src="https://img.shields.io/badge/license-MPLv2-blue.svg" />
  </a>
  <a href="https://rubygems.org/gems/rowdb">
    <img src="https://badge.fury.io/rb/rowdb.svg" alt="Gem Version" />
  </a>

</p>

A local JSON database for Ruby inspired by [lowdb](https://github.com/typicode/lowdb), using [Rudash](https://github.com/Attrash-Islam/rudash) for easy Hash traversal.

## Usage

```ruby
# Load the database.
db = Rowdb.new('db.json')

# Set a default structure.
db.defaults({ 'checklist' => [] }).write()

# Set data.
db.set('checklist[0]', 'milk')
  .set('checklist[1]', 'cheese')
  .set('checklist[2]', 'eggs')
  .write()

# Push data.
db.get('checklist')
  .push('spam')
  .write()

# Get data.
db.get('checklist').value() # => ["milk", "cheese", "eggs", "spam"]
```

Method execution is lazy, values are only returned or written after calling `value()` or `write()`.

## Installation

In your Gemfile add:
```ruby
gem "rowdb"
```  

Then run:
```
bundle install
```

Or install globally with:
```
gem install rowdb
```

## Why?

I needed to store data for [Reflekt](https://github.com/maedi/reflekt) in the file system.

## API

All methods return a `Rowdb` instance which you can chain other methods on.

### new()

```ruby
Rowdb.new(file_name, adapter = :sync, js_var = "db")
```

**Example:**
```ruby
db = Rowdb.new('db.json')
```

**Params:**
* `file_name` - The path to the file. Accepts path relative to execution path or absolute path. Acceptable file extensions are ".json" and ".js".
* `adapter` - The method to read and write data. Defaults to a synchronous file system.
* `js_var` - The name of the variable that the JSON is assigned to when `file_name` ends in ".js".

### defaults()

```ruby
Rowb.defaults(data)
```

**Params:**
* Hash `data` - The default structure of the database.


### get()

```ruby
Rowdb.get(path)
```

**Params:**
* String `path` - The path query mirroring [Rudash API](https://rudash-website.now.sh/).

### set()

```ruby
Rowdb.set(path, value)
```

**Params:**
* String `path` - The path query mirroring [Rudash API](https://rudash-website.now.sh/).
* Object `value` - The value you wish to store.

### push()

```ruby
Rowdb.push(value)
```

Push a value onto an array. Must be chained after a `get()` which gets the array to push to.

**Example:**
```ruby
db.get('items')
  .push('item')
```

**Params:**
* Object `value` - The value you wish to store.

### value()

```ruby
Rowdb.value()
```

**Returns:** The value stored in the database.

### write()

```ruby
Rowdb.write()
```

Saves the data to the file system.
