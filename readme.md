# RightsUp / Declaration Excercice

## First step

One of our main process is to declare our catalog to collecting societies.
Each collecting society is attached to a country, and manage one type of rights.

When RightsUp declare, we declare the maxium of our catalog to one coutry for one specific type of rights.

For one country, we have the following type of specifications:
- A sheet header: given string as header, we need to match the correct data.
- Requirements for data validity and data formatting (a little more on that later)

The first part of this exercice is to find a way to implement these specifications in order to be the most flexible for future requirements.

Lets say that the header is:
```ruby
["Artists", "Track Title and Version"]
```

Lets say the "Track Title and Version" columns take as value track title and version, but the version, if any, should be between ().
```ruby
"Track Title (Version)"
```

Lets say that the strategy should hold the following data requirements:
- One should not declare tracks that have 'VARIOUS ARTISTS' as one of their artist.
- One should not declare tracks that have 'karaoke' as their library type.


In order to solve that, you have to define:
- a way of getting the data given the sheet header and to format these values.
- a way to store the data requirements

Lets say that track respond to question #include_various_artists? and #karaoke?.

#### Bonus
Is your solution working if the required header is:

```ruby
["Artist Name 1", "Artist Name 2", "Track Title"]
```

## Second step

The second part of this exercice, is to use this implementation to declare our catalog.

We declare tracks ...
- that haven been declared.
- which RightsUp is licensed to declare in that country
  That is, we need the following conditions
  - the contract with the client must include the country
  - the claiming rules (licenses) include rights for that country
  This part is meant to be abstracted. So you can define a stub method on the track, that given a country and a track, return true or false.
- that match specific requirements in terms of data

Create a class that takes a strategy and declare our track. You can simplify the problem as you want.
But the least you simplify the proble, the better of course.

The end goal is to find a solution for the given spec in declaration_writer_spec.rb.
