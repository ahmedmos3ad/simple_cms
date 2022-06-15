class SubjectsController < ApplicationController
  
  def index
    @subjects= Subject.all.order(:id)
    #render json:@subjects
    #render json:SubjectSerializer.new(@subjects).serializable_hash
    render json:serialize_collection("Subject",@subjects)
  end

  def show
    begin
    @subject= Subject.find(params[:id])
      #render json:@subject
      #render json:SubjectSerializer.new(@subject).serializable_hash[:data]
      render json:serialize_record("Subject",@subject)
    rescue =>e
      render json:e.message, status:404
    end
  end

  def create
    @subject= Subject.new(subject_params)
    begin
      if @subject.save!
        render json:serialize_record("Subject",@subject), status: :created
      end
    rescue =>e
      render json:e.message, status:422
    end
  end
  
  def update
    begin
      @subject= Subject.find(params[:id])
      AuthenticationTokenService.call(@subject.id)
      @subject.assign_attributes(subject_params)
      @subject.save!
      render json:serialize_record("Subject",@subject), status: :ok
    rescue => e
      render json:e.message, status:422
    end
  end

  def destroy
    begin
      @subject= Subject.find(params[:id])
      @subject.destroy!
      #redirect_to(subjects_path)
      render json:"Subject with ID #{@subject.id} has been deleted."
    rescue => e
      render json:e.message, status:422
    end
  end

  private 

  def subject_params
   params.require(:subject).permit(:name,:position,:visible)
  end
end
