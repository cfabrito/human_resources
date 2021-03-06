require 'spec_helper'

describe TeamsController do
  login_user

  describe 'GET teams#index' do
    before do
      @team = FactoryGirl.create(:team, user_id: @user_id)
    end

    it 'populates an array of teams, @teams' do
      get :index, user_id: @user_id
      assigns(:teams).should eq([@team]);
    end

    it 'renders the teams#index template' do
      get :index, user_id: @user_id
      response.should render_template :index
    end
  end

  describe 'GET teams#show' do
    before do
      @team = FactoryGirl.create(:team, user_id: @user_id)
    end

    it 'assigns the requested team to @team' do
      get :show, id: @team, user_id: @user_id
      assigns(:team).should eq(@team)
    end

    it 'renders the teams#show template' do
      get :show, id: @team, user_id: @user_id
      response.should render_template(:show)
    end
  end

  describe 'GET teams#new' do
    it 'creates a new team entry' do
      get :new, user_id: @user_id
      assigns(:team).should be_a_new(Team)
    end
  end

  describe 'GET teams#edit' do
    before do
      @team = FactoryGirl.create(:team, user_id: @user_id)
    end

    it 'assigns the requested team to @team' do
      get :edit, id: @team, user_id: @user_id
      assigns(:team).should eq(@team)
    end
  end

  describe 'GET teams#change_people' do
    before do
      @team = FactoryGirl.create(:team, :with_people, people_count: 2, user_id: @user_id)
      @person = FactoryGirl.create(:person, user_id: @user_id)
    end

    it 'assigns the requested team to @team' do
      get :change_people, id: @team, user_id: @user_id
      assigns(:team).should eq(@team);
    end

    it 'assigns non-member people to @people' do
      get :change_people, id: @team, user_id: @user_id
      assigns(:people).should eq([@person]);
    end

    it 'should render the :change_people view' do
      get :change_people, id:@team, user_id: @user_id
      response.should render_template :change_people
    end
  end

  describe 'POST teams#add_person' do
    before :each do
      @team = FactoryGirl.create(:team, :with_people, people_count: 2, user_id: @user_id)
      @person = FactoryGirl.create(:person)
    end

    it 'adds an entry to the join database' do
      expect {
          post :add_person, id: @team, person_id: @person.id, user_id: @user_id
      }.to change(@team.people, :count).by(1)
    end

    it 'redirects to team#change_people' do
      post :add_person, id: @team.id, person_id: @person.id, user_id: @user_id
      response.should redirect_to :change_people_user_team
    end
  end

  describe 'DELETE teams#remove_person' do
  before :each do
      @team = FactoryGirl.create(:team, :with_people, people_count: 2, user_id: @user_id)
      @person = @team.people.first;
    end

    it 'removes an entry from the join database' do
      expect {
          delete :remove_person, id: @team.id, person_id: @person.id, user_id: @user_id
      }.to change(@team.people, :count).by(-1)
    end

    it 'redirects to team#change_people' do
      delete :remove_person, id: @team.id, person_id: @person.id, user_id: @user_id
      response.should redirect_to :change_people_user_team
    end
  end

  describe 'POST teams#create' do
    context 'valid attributes' do
      before do
        @valid_attributes = FactoryGirl.attributes_for(:team).merge(user_id: @user_id)
      end

      it 'creates a new team' do
        expect {
          post :create, team: @valid_attributes, user_id: @user_id
        }.to change(Team, :count).by(1)
      end
      it 'redirects to GET teams#show of the new entry' do
        post :create, team: @valid_attributes, user_id: @user_id
        response.should redirect_to user_team_path(@user_id, Team.last)
      end
    end

    context 'invalid attributes' do
      before do
        @invalid_attributes = FactoryGirl.attributes_for(:team).merge(user_id: @user_id)
        @invalid_attributes[:name] = nil
      end

      it 'does not save the new entry' do
        expect {
          post :create, team: @invalid_attributes, user_id: @user_id
        }.to_not change(Team, :count)
      end

      it 're-renders new' do
        post :create, team: @invalid_attributes, user_id: @user_id
        response.should render_template :new
      end
    end
  end

  describe 'PATCH teams#update' do
    context 'valid attributes' do
      before :each do
        @team = FactoryGirl.create(:team, user_id: @user_id)
        @valid_attributes = FactoryGirl.attributes_for(:team)
      end

      it 'located the requested @team' do
        patch :update, id: @team, team: @valid_attributes, user_id: @user_id
        assigns(:team).should eq (@team)
      end

      it 'changes @team\'s attributes' do
        patch :update, id: @team, team: @valid_attributes, user_id: @user_id
        @team.reload
        @valid_attributes.except(:user_id).each {|k, v| @team.attributes[k.to_s].should eq v }
      end

      it 'redirects to the updated team page' do
        put :update, id: @team, team: @valid_attributes, user_id: @user_id
        response.should redirect_to user_team_path(@user_id, @team)
      end

    end

    context 'invalid attributes' do
      before :each do
        @team = FactoryGirl.create(:team, user_id: @user_id)
        @invalid_attributes = FactoryGirl.attributes_for(:team).merge(user_id: @user_id)
        @invalid_attributes[:name] = nil
      end

      it 'located the requested @team' do
        patch :update, id: @team, team: @invalid_attributes, user_id: @user_id
        assigns(:team).should eq (@team)
      end

      it 'does not change the @team\'s attributes' do
        patch :update, id: @team, team: @invalid_attributes, user_id: @user_id
        @team.reload
        @invalid_attributes.except(:user_id).each {|k, v| @team.attributes[k.to_s].should_not eq v }
      end

      it 're-renders edit' do
        put :update, id: @team, team: @invalid_attributes, user_id: @user_id
        response.should render_template :edit
      end
    end
  end
  describe 'DELETE teams#destroy' do
    before :each do
      @team = FactoryGirl.create(:team, user_id: @user_id)
    end

    it 'deletes the team' do
      expect {
        delete :destroy, id: @team, user_id: @user_id
      }.to change(Team, :count).by(-1) and Team.find_by(id: @team.id).should eq nil
    end

    it 'redirects to index' do
      delete :destroy, id: @team, user_id: @user_id
      response.should redirect_to user_teams_path(@user_id)
    end
  end
end
