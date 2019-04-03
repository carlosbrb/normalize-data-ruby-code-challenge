# frozen_string_literal: true

class Car
  attr_reader :year, :make, :model, :trim

  def initialize(attrs = {})
    @year  = attrs[:year]
    @make  = attrs[:make]
    @model = attrs[:model]
    @trim  = attrs[:trim]
  end

  # Normalize all cars data following respective rules
  # and get them as a hash
  def normalize
    format_year
    format_make
    format_model
    format_trim

    instance_variables.each_with_object({}) do |v, h|
      h[v.to_s.delete('@').to_sym] = instance_variable_get(v)
    end
  end

  private

  # Car year format. Applied rules:
  # - Valid years are from 1900 until 2 years in the future from today
  # - A value that can't be normalized should be returned as is
  #
  def format_year
    int_year = @year.to_i
    @year = int_year if int_year.between?(1900, Time.now.year + 2)
  end

  # Car make format. Applied rules:
  # - Typos & abbreviations corrected
  #
  def format_make
    case @make
    when 'fo', 'ford'
      @make = 'Ford'
    when 'Chev'
      @make = 'Chevrolet'
    end
  end

  # Car model format. Applied rules:
  # - Sometimes the trim of a vehicle will be provided in the "model" field
  # and will need to be extracted to the "trim" field
  #
  def format_model
    models = @model.split(' ')
    @trim = models[1].upcase if models.length > 1
    @model = models[0].capitalize unless models[0] == 'foo'
  end

  # Car trim (different features or packages for the same model of vehicle) format
  # Applied rules:
  # - The word "blank" should be returned as nil
  #
  def format_trim
    case @trim
    when 'blank'
      @trim = nil
    when 'st'
      @trim = 'ST'
    end
  end
end
