class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :destroy]

  # GET /subjects
  def index
    @subjects = Subject.all
    respond_to do |format|
      format.html
      format.csv { send_data @subjects.to_csv }
      format.xls
    end
  end

  # GET /subjects/1
  def show
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
    end
  end

  def shared
    @subject = Subject.find_by uid: params[:token]
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end
end
