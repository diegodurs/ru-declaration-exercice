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

Lets say that the header is:
```ruby
["Artists", "Track Title and Version"]
# Adhoc specifications
# - "Track Title and Version" should hold version between () if any
# - "Artists" should hold names of artist separated by ','
```

Lets say that the strategy should hold the following data requirements:
- One should not declare tracks that have 'VARIOUS ARTISTS' as one of their artist.
- One should not declare tracks that have 'karaoke' as their library type.

In order to solve that, you may have to define:
- a way of getting the data given the columns specification.
- a way to store the data requirements

Lets say that track respond to question #include_various_artists? and #karaoke?.

#### Bonus
Is your solution working if the required header is (the meaning of columns - ie. adhoc spec - should be obvious):

```ruby
["Artist Name 1", "Artist Name 2", "Track Title"]
```

## Second step

The second part of this exercice, is to use this implementation to declare our catalog.

We declare tracks ...
- that match specific requirements in terms of data
- that haven't been declared yet in that country.
- which RightsUp is licensed to declare in that country
  This part is meant to be abstracted. So you can define a stub method on the track, that given a country and a track, return true or false.

Create a class that takes a strategy and declare our tracks.
You can simplify the problem as you want.

The end goal is to find an implementation of DeclarationWriter::declare(...) for the given spec in declaration_writer_spec.rb.
