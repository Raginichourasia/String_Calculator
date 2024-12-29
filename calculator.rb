class MyCalculator
  def self.add(input)
    return 0 if input.strip.empty?

    numbers = parse_input(input)
    negative_numbers = numbers.select(&:negative?)

    if negative_numbers.any?
      raise "negative numbers not allowed: #{negative_numbers.join(', ')}"
    end

    numbers.sum
  end

  private

  def self.parse_input(input)
    if input.start_with?("//")
      delimiter, numbers = input[2..].split("\n", 2)
      numbers.split(/[\n,#{delimiter}]/).map(&:to_i)
    else
      input.gsub("\n", ',').split(',').map(&:to_i)
    end
  end
end
