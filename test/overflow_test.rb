# test/tabletop.rb

require_relative '../lib/overflow'
require 'minitest/autorun'

describe Overflow do

  describe 'number_of_glasses_j_in_row_i()' do
    it 'returns one more glass for the row number, row_i = 0' do
      row_i = 0
      Overflow.number_of_glasses_j_in_row_i(row_i).must_equal 1
    end

    it 'returns one more glass for the row number, row_i = 1' do
      row_i = 1
      Overflow.number_of_glasses_j_in_row_i(row_i).must_equal 2
    end

    it 'returns one more glass for the row number, row_i = 2' do
      row_i = 2
      Overflow.number_of_glasses_j_in_row_i(row_i).must_equal 3
    end
  end

  describe '.volume_in_row_i()' do
    it 'multiplies the volume of each glass by the number of glasses, row_i = 0' do
      volume_of_glass_j = 250
      row_i = 0
      Overflow.volume_in_row_i(volume_of_glass_j, row_i).must_equal 250
    end

    it 'multiplies the volume of each glass by the number of glasses, row_i = 1' do
      volume_of_glass_j = 250
      row_i = 1
      Overflow.volume_in_row_i(volume_of_glass_j, row_i).must_equal 500
    end

    it 'multiplies the volume of each glass by the number of glasses, row_i = 2' do
      volume_of_glass_j = 250
      row_i = 2
      Overflow.volume_in_row_i(volume_of_glass_j, row_i).must_equal 750
    end
  end

  describe '.volume_per_glass_j_in_row_i()' do
    it 'returns a partial amount per glass, row_i = 0' do
      volume = 200
      volume_of_glass_j = 250
      row_i = 0
      Overflow.volume_per_glass_j_in_row_i(volume, volume_of_glass_j, row_i).must_equal 200
    end

    it 'returns a partial amount per glass, row_i = 1' do
      volume = 400
      volume_of_glass_j = 250
      row_i = 1
      Overflow.volume_per_glass_j_in_row_i(volume, volume_of_glass_j, row_i).must_equal 200
    end

    it 'returns the whole volume of a glass, row_i = 1' do
      volume = 500
      volume_of_glass_j = 250
      row_i = 1
      Overflow.volume_per_glass_j_in_row_i(volume, volume_of_glass_j, row_i).must_equal 250
    end
  end

end
