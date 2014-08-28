require 'spec_helper'

describe PeopleController do
  describe "GET #index" do
    it "displays a list of every person entry in the database"
  end
  
  describe "GET people#show" do
    it "displays every field in a person entry"
  end
  
  describe "GET #new" do
    it "displays a form with all of the person model fields"
    it "redirects to POST people#create when form is submited"
    it "displays an error message if any field is invalid"
    it "redirects to GET people#new if any field is invalid"
  end
  
  describe "GET people#edit" do
    it "displays a form with all of the person model fields"
    it "redirects to PATCH people#update when form is submited"
    it "displays an error message if any field is invalid"
    it "redirects to GET people#edit if any field is invalid"
  end
end
