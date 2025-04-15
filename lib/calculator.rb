# frozen_string_literal: true

class Calculator # rubocop:disable Style/Documentation
  def add(numbers) # rubocop:disable Metrics/MethodLength
    return 0 if numbers.empty?

    delimiter_pattern = /,|\n/

    if numbers.start_with?('//')
      delimiter_section, numbers = numbers.split("\n", 2)

      custom_delimiters = delimiter_section.scan(/\[(.*?)\]/).flatten

      delimiter_pattern =
        if custom_delimiters.any?
          Regexp.union(custom_delimiters.map { |d| Regexp.escape(d) })
        else
          Regexp.escape(delimiter_section[2])
        end
    end

    numbers.split(delimiter_pattern).map(&:to_i).sum
  end
end
