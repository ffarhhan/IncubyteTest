# frozen_string_literal: true

class Calculator # rubocop:disable Style/Documentation
  def add(numbers) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
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
    nums = numbers.split(delimiter_pattern).map(&:to_i)
    check_for_negatives(nums)

    nums.sum
  end

  private

  def check_for_negatives(nums)
    negatives = nums.select(&:negative?)
    raise "Negative number not allowed: #{negatives.join(', ')}" if negatives.any?
  end
end
