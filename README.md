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

Basically I created a class that groups all the business logic for the normalization of cars data provided in the example. You could have used a different class name such as CarNormalization to be more descriptive, but I preferred to name it Car to maintain simplicity in this particular example.
The usage examples can be found in the code documentation or just running `rdoc` in the console.

### Useful documentation and core concepts about implementation

- https://ruby-doc.org/core-2.6.1/Hash.html
- https://ruby-doc.org/core-2.6.1/Object.html#method-i-instance_variables
- https://ruby-doc.org/core-2.6.1/Enumerable.html
- https://ruby-doc.org/core-2.6.1/Comparable.html#method-i-between-3F


## Running the program

Ruby 2.6.1 version was used for this example. This tutorial assumes that you have ruby 2.6.1 installed. If not, check this link: https://www.ruby-lang.org/en/documentation/installation/

Steps:

1. Clone the project
2. Run in the console

`# ruby normalize.rb`

## Run in Docker

If you feel lazy and don't want to install ruby to test the example you can run the code challenge in docker:

`# docker build -t ruby-challenge .`
`# docker run -it ruby-challenge`

If you don't see anything in the output means that the examples passed, otherwise you should see the respective errors.

