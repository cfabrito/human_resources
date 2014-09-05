require 'spec_helper'

describe PeopleController do
  describe 'GET people#index' do
    before do
      @person = FactoryGirl.create(:person)
    end
    it 'populates an array of people, @people' do
      get :index
      assigns(:people).should eq([@person]);
    end

    it 'renders the people#index template' do
      get :index
      response.should render_template :index
    end
  end

  describe 'GET people#show' do
    it 'assigns the requested person to @person' do
      person = FactoryGirl.create(:person)
      get :show, id: person
      assigns(:person).should eq(person)
    end

    it 'renders the people#show template' do
      get :show, id: FactoryGirl.create(:person)
      response.should render_template(:show)
    end
  end

  describe 'GET people#new' do
    it 'creates a new person entry' do
      get :new
      assigns(:person).should be_a_new(Person)
    end
  end

  describe 'GET people#edit' do
    it 'assigns the requested person to @person' do
      person = FactoryGirl.create(:person)
      get :edit, id: person
      assigns(:person).should eq(person)
    end
  end

  describe 'POST people#create'do
    context 'valid attributes' do
      before do
        @valid_attributes = FactoryGirl.attributes_for(:person)
      end

      it 'creates a new person' do
        expect {
          post :create, person: @valid_attributes
        }.to change(Person, :count).by(1)
      end
      it 'redirects to GET people#show of the new entry' do
        post :create, person: @valid_attributes
        response.should redirect_to Person.last
      end
    end

    context 'invalid attributes' do
      before do
        @invalid_attributes = FactoryGirl.attributes_for(:person)
        @invalid_attributes[:first_name] = nil
      end

      it 'does not save the new entry' do
        expect {
          post :create, person: @invalid_attributes
        }.to_not change(Person, :count)
      end
      it 're-renders new' do
        post :create, person: @invalid_attributes
        response.should render_template :new
      end
    end
  end
  describe 'PATCH people#update' do
    context 'valid attributes' do
      before :each do
        @person = FactoryGirl.create(:person)
        @valid_attributes = FactoryGirl.attributes_for(:person)
      end

      it 'located the requested @person' do
        patch :update, id: @person, person: @valid_attributes
        assigns(:person).should eq (@person)
      end

      it 'changes @person\'s attributes' do
        patch :update, id: @person, person: @valid_attributes
        @person.reload
        @valid_attributes.each {|k, v| @person.attributes[k.to_s].should eq v }
      end

      it 'redirects to the updated person page' do
        put :update, id: @person, person: @valid_attributes
        response.should redirect_to @person
      end

    end

    context 'invalid attributes' do
      before :each do
        @person = FactoryGirl.create(:person)
        @invalid_attributes = FactoryGirl.attributes_for(:person)
        @invalid_attributes[:first_name] = nil
      end

      it 'located the requested @person' do
        patch :update, id: @person, person: @invalid_attributes
        assigns(:person).should eq (@person)
      end

      it 'does not change the @person\'s attributes' do
        patch :update, id: @person, person: @invalid_attributes
        @person.reload
        @invalid_attributes.each {|k, v| @person.attributes[k.to_s].should_not eq v }
      end

      it 're-renders edit' do
        put :update, id: @person, person: @invalid_attributes
        response.should render_template :edit
      end
    end
  end
  describe 'DELETE people#destroy' do
    before :each do
      @person = FactoryGirl.create(:person)
    end

    it 'deletes the person' do
      expect {
        delete :destroy, id: @person
      }.to change(Person, :count).by(-1) and Person.find_by(id: @person.id).should eq nil
    end

    it 'redirects to index' do
      delete :destroy, id: @person
      response.should redirect_to people_path
    end
  end
end
