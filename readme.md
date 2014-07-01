# RightsUp / Declaration Excercice

## First step

One of our main process is to declare our catalog to collecting societies.
Each collecting society is attached to a country, and manage one type of rights.

When RightsUp declare, we declare the maximum of our catalog to one country for one specific type of rights.

For one country, we have the following type of specifications:
- A columns specification:
  - an array of pure String which is the header of the file
  - an adhoc specifications on the values of each columns
    - "Artists Names" should hold names of artist separated by ','
    - "Track Title And Version" hold the title and the version. If any, the version should be between parenthesis '()'
- Requirements for data validity (a little more on that later)

The first part of this exercice is to find a way to implement these specifications in order to be the most flexible for future requirements.

Lets say that the collecting society gives us the following columns format for the declaration:
```ruby
usa = [
  "Artists", # should hold names of artist separated by ','
  "Track Title and Version" # should hold version between () if any
]
```

Keep in mind that a spanish collecting society could ask us the following header

```ruby
[
  "Artists", # should hold names of artist separated by 'y' ('and' in english)
  "Track Title and Version" # should hold title and version separated by '-' if any version
]
```

So your solution should be flexible.


Lets say that the strategy should hold the following data requirements:
- One should not declare tracks that have 'VARIOUS ARTISTS' as one of their artist.
- One should not declare tracks that have 'karaoke' as their library type.

In order to solve that, you may have to define:
- a way of storing the column mapping and getting the correct data given the correct formatting
- a way to store the data requirements (ie: validations)

Lets say that track respond to question #include_various_artists? and #karaoke?.

### Others examples of requirements
#### ColumnSpecification 2
```ruby
belgium = [
  "Artist Name 1", # first artist's name
  "Artist Name 2", # second artist's name
  "Track Title"
]
```
#### ColumnSpecification 3
```ruby
france = [ "Artists - Track Title (Version)" ]
```
#### ColumnSpecification 4
Lets say we have releases attached to a track.
```ruby
class Release
  attr_accessor :title
end
```
For one track, we need to declare all the releases, one per line.

```ruby
uk = [
  "Artists",
  "Track Title And Version",
  "Release Title"
]
```

### Extra
* Can we list our validation rules ?
* Can we list all our values types ?
* Will the list of the rules and values will explode over time?

## Second step
The second part of this exercice, is to use this implementation to declare our catalog.

We declare tracks ...
- that match specific requirements in terms of data
- that haven't been declared yet in that country.
- which RightsUp is licensed to declare in that country
  This part is meant to be abstracted. So you can define a stub method on the track, that given a country and a track, return true or false.

Create a class that takes a strategy and declare our tracks.
Think flexible and reusable!

The end goal is to find an real implementation of declaration_writer_spec.rb.
