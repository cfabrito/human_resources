class PeopleController < ApplicationController
  def index
    @people = Person.all
  end
  
  def new
    @article = Person.new
  end
  
  def create
    @person = Person.new(person_params)
 
    if @person.save
      redirect_to @person
    else
      render 'new'
    end
  end
  
  def show
    @person = Person.find(params[:id])
  end
  
  private
    def person_params
      params.require(:person).permit(:first_name, :last_name, :phone_number, :email, :birth_date, :linkedin_url)
    end
end
