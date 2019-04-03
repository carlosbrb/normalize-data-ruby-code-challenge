## Description

These example problems are similar to what we run into where we get car data from a wide variety of sources, and need to normalize the data. Many times users will have typos or use shorthand in a given field.

## Instructions
Complete the normalize_data function below to make the examples pass. Feel free to add classes or helper methods as needed.

## Things to consider
- "trim" refers to different features or packages for the same model of vehicle
- Valid years are from 1900 until 2 years in the future from today
- A value that can't be normalized should be returned as is
- Sometimes the trim of a vehicle will be provided in the "model" field, and will need to be extracted to the "trim" field
- The word "blank" should be returned as nil

## Code

```ruby
def normalize_data(input)
end
```
```ruby
examples = [
  [{ :year => '2018', :make => 'fo', :model => 'focus', :trim => 'blank' }, { :year => 2018, :make => 'Ford', :model => 'Focus', :trim => nil }],
  [{ :year => '200', :make => 'blah', :model => 'foo', :trim => 'bar' }, { :year => '200', :make => 'blah', :model => 'foo', :trim => 'bar' }],
  [{ :year => '1999', :make => 'Chev', :model => 'IMPALA', :trim => 'st' }, { :year => 1999, :make => 'Chevrolet', :model => 'Impala', :trim => 'ST' }],
  [{ :year => '2000', :make => 'ford', :model => 'focus se', :trim => '' }, { :year => 2000, :make => 'Ford', :model => 'Focus', :trim => 'SE' }]
]

examples.each_with_index do |(input, expected_output), index|
  output = normalize_data(input)

  if output != expected_output
    puts "Example #{index + 1} failed,
          Expected: #{expected_output.inspect}
          Got:      #{output.inspect}"
  end
end
```

## Implemented solution
TBD