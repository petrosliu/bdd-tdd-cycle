require 'spec_helper'

describe Movie do
  describe 'searching for directors' do
    it 'should search movies with director' do
      Movie.should_receive(:discover).with('THX-1138')
      Movie.discover('THX-1138')
    end
  end
end