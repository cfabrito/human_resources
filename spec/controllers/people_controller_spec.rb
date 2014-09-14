require 'spec_helper'

describe PeopleController do
  login_user

  describe 'GET people#index' do
    before do
      @person = FactoryGirl.create(:person, user_id: @user_id)
    end
    it 'populates an array of people, @people' do
      get :index, user_id: @user_id
      assigns(:people).should eq([@person]);
    end

    it 'renders the people#index template' do
      get :index, user_id: @user_id
      response.should render_template :index
    end
  end

  describe 'GET people#show' do
    before do
      @person = FactoryGirl.create(:person, user_id: @user_id)
    end

    it 'assigns the requested person to @person' do
      get :show, id: @person, user_id: @user_id
      assigns(:person).should eq(@person)
    end

    it 'renders the people#show template' do
      get :show, id: @person, user_id: @user_id
      response.should render_template(:show)
    end
  end

  describe 'GET people#new' do
    it 'creates a new person entry' do
      get :new, user_id: @user_id
      assigns(:person).should be_a_new(Person)
    end
  end

  describe 'GET people#edit' do
    before do
      @person = FactoryGirl.create(:person, user_id: @user_id)
    end

    it 'assigns the requested person to @person' do
      get :edit, id: @person, user_id: @user_id
      assigns(:person).should eq(@person)
    end
  end

  describe 'POST people#create'do
    context 'valid attributes' do
      before do
        @valid_attributes = FactoryGirl.attributes_for(:person).merge(user_id: @user_id)
      end

      it 'creates a new person' do
        expect {
          post :create, person: @valid_attributes, user_id: @user_id
        }.to change(Person, :count).by(1)
      end
      it 'redirects to GET people#show of the new entry' do
        post :create, person: @valid_attributes, user_id: @user_id
        response.should redirect_to user_person_path(@user_id, Person.last)
      end
    end

    context 'invalid attributes' do
      before do
        @invalid_attributes = FactoryGirl.attributes_for(:person).merge(user_id: @user_id)
        @invalid_attributes[:first_name] = nil
      end

      it 'does not save the new entry' do
        expect {
          post :create, person: @invalid_attributes, user_id: @user_id
        }.to_not change(Person, :count)
      end
      it 're-renders new' do
        post :create, person: @invalid_attributes, user_id: @user_id
        response.should render_template :new
      end
    end
  end
  describe 'PATCH people#update' do
    context 'valid attributes' do
      before :each do
        @person = FactoryGirl.create(:person, user_id: @user_id)
        @valid_attributes = FactoryGirl.attributes_for(:person)
      end

      it 'located the requested @person' do
        patch :update, id: @person, person: @valid_attributes, user_id: @user_id
        assigns(:person).should eq (@person)
      end

      it 'changes @person\'s attributes' do
        patch :update, id: @person, person: @valid_attributes, user_id: @user_id
        @person.reload
        @valid_attributes.each {|k, v| @person.attributes[k.to_s].should eq v }
      end

      it 'redirects to the updated person page' do
        put :update, id: @person, person: @valid_attributes, user_id: @user_id
        response.should redirect_to user_person_path(@user_id, @person)
      end

    end

    context 'invalid attributes' do
      before :each do
        @person = FactoryGirl.create(:person, user_id: @user_id)
        @invalid_attributes = FactoryGirl.attributes_for(:person).merge(user_id: @user_id)
        @invalid_attributes[:first_name] = nil
      end

      it 'located the requested @person' do
        patch :update, id: @person, person: @invalid_attributes, user_id: @user_id
        assigns(:person).should eq (@person)
      end

      it 'does not change the @person\'s attributes' do
        patch :update, id: @person, person: @invalid_attributes, user_id: @user_id
        @person.reload
        @invalid_attributes.except(:user_id).each {|k, v| @person.attributes[k.to_s].should_not eq v }
      end

      it 're-renders edit' do
        put :update, id: @person, person: @invalid_attributes, user_id: @user_id
        response.should render_template :edit
      end
    end
  end
  describe 'DELETE people#destroy' do
    before :each do
      @person = FactoryGirl.create(:person, user_id: @user_id)
    end

    it 'deletes the person' do
      expect {
        delete :destroy, id: @person, user_id: @user_id
      }.to change(Person, :count).by(-1) and Person.find_by(id: @person.id).should eq nil
    end

    it 'redirects to index' do
      delete :destroy, id: @person, user_id: @user_id
      response.should redirect_to user_people_path
    end
  end
end
