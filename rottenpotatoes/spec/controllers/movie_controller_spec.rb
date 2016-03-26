require 'spec_helper'

describe MoviesController do
  describe 'happy path' do
    before(:each) do
      @movie = double(Movie, :title => "THX-1138", :director => "George Lucas", :id => "1")
      Movie.stub(:find).with("1").and_return(@movie)
    end
    it 'should generate route for discover page' do
      {:post => discover_path(1)}.should route_to("movies#discover", :id => "1")
    end
  end
  
  describe 'sad path' do
    before(:each) do
      @movie = double(Movie, :title => "THX-1138", :director => nil, :id => "1")
      Movie.stub(:find).with("1").and_return(@movie)
    end
    it 'should generate route for discover page' do
      {:post => discover_path(1)}.should route_to("movies#discover", :id => "1")
    end
    it 'should redirect to movies and show a flash message' do
      get :discover, :id => "1"
      response.should redirect_to(movies_path)
      flash[:notice].should_not be_nil
    end
  end
end
