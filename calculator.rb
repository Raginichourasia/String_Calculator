class MyCalculator
  def self.add(input)
    return 0 if input.strip.empty?

    numbers = parse_input(input)
    numbers = numbers.reject { |n| n > 10000 }

    check_for_negative_numbers(numbers)

    numbers.sum
  end

  private

  def self.parse_input(input)
    if input.start_with?("//")
      delimiter, numbers = input[2..].split("\n", 2)
      split_numbers(numbers, delimiter)
    else
      split_numbers(input, ",")
    end
  end

  def self.split_numbers(input, delimiter)
    input.split(/[\n,#{delimiter}]/).map(&:to_i)
  end

  def self.check_for_negative_numbers(numbers)
    negative_numbers = numbers.select(&:negative?)
    
    if negative_numbers.any?
      raise "negative numbers not allowed: #{negative_numbers.join(', ')}"
    end
  end
end
