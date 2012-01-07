class SearchController < ApplicationController
  
  
  def index
    @pros = Pro.all#= Pro.search { fulltext 'animateur' }
  end

end
