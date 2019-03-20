# overflow.rb

module Overflow

  module_function

  # I've made this an assumption from the description of the problem rather than parameterising it,
  # since a variable number of glasses per row is possible.
  def number_of_glasses_j_in_row_i(row_i)
    row_i + 1
  end

  def volume_in_row_i(row_i)
    volume_of_glass_j * number_of_glasses_j_in_row_i(row_i)
  end

  # Integer arithmetic only being performed here.
  def volume_per_glass_j_in_row_i(volume, row_i)
    if volume > volume_in_row_i(row_i)
      volume_of_glass_j
    else
      volume/number_of_glasses_j_in_row_i(row_i)
    end
  end

  def calculate_row(row_i, total_volume_consumed, total_volume_remaining)
    if total_volume_remaining > volume_in_row_i(row_i)
      total_volume_consumed += volume_in_row_i(row_i)
      total_volume_remaining = total_volume_remaining - volume_in_row_i(row_i)
    else
      total_volume_consumed += total_volume_remaining
      total_volume_remaining = 0
    end
    [total_volume_consumed, total_volume_remaining]
  end

  def calculate_all(volume_of_liquid, number_of_rows, volume_of_glass_j)
    row_i = 0
    total_volume_consumed = 0
    total_volume_remaining = volume_of_liquid
    until total_volume_remaining <= 0 || row_i >= number_of_rows
      last_remaining_volume = total_volume_remaining
      total_volume_consumed, total_volume_remaining = calculate_row(row_i, total_volume_consumed, total_volume_remaining)
      puts "#{row_i}: #{total_volume_consumed}/#{volume_of_liquid}"
      row_i += 1
    end
    puts "Volume per glass in the last row: #{volume_per_glass_j_in_row_i(last_remaining_volume, row_i - 1)}"
  end

end
