#!/usr/bin/env ruby

# 20190307
# 0.0.0

# Description: 
# I did this in less than an hour. It has no tests. Can do more...

def volume_of_liquid
  ARGV[0] || 2000
end

def number_of_rows
  ARGV[1] || 4
end

def volume_of_glass_j
  ARGV[2] || 250
end

# I've made this an assumption from the description of the problem rather than parameterising it,
# since a variable number of glasses per row is possible.
def number_of_glasses_j_in_row_i(row_i)
  row_i + 1
end

def volume_in_row(row_i)
  volume_of_glass_j * number_of_glasses_j_in_row_i(row_i)
end

def volume_of_liquid_consumed_by_row_i(volume, row_i)
  volume_in_row(row_i) - volume
end

def volume_per_glass_j_in_row_i(volume, row_i)
  volume/number_of_glasses_j_in_row_i(row_i)
end

def main
  row_i = 0
  volume_remaining = volume_of_liquid
  until volume_remaining <= 0 || row_i >= number_of_rows
    p row_i
    p volume_remaining = volume_remaining - volume_in_row(row_i)
    row_i += 1
  end
  p volume_of_liquid_consumed_by_row_i(volume_remaining, row_i - 1)
  p volume_per_glass_j_in_row_i(volume_remaining, row_i - 1)
end

main
