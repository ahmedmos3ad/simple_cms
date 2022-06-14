class SubjectsController < ApplicationController
  
  def index
    @subjects= Subject.all.order(:id)
    render json:@subjects
  end

  def show
    @subject= Subject.where(id:params[:id])
    if !@subject.empty?
      render json:@subject
    else
      render plain:"Subject Doesn't Exist", status:404
    end
  end

  def create
    @subject= Subject.new(subject_params)
    begin
      if @subject.save!
        redirect_to(subjects_path)
      end
    rescue =>e
      render json:e.message, status:422
    end
  end
  
  def update
    begin
      @subject= Subject.find(params[:id])
      @subject.assign_attributes(subject_params)
      @subject.save!
      redirect_to(subject_path(@subject))
    rescue => e
      render json:e.message, status:422
    end
  end

  def destroy
    begin
      @subject= Subject.find(params[:id])
      @subject.destroy!
      redirect_to(subjects_path)
    rescue => e
      render json:e.message, status:422
    end
  end

  private 

  def subject_params
   params.require(:subject).permit(:name,:position,:visible)
  end
end
