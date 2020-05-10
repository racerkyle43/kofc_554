class NewslettersController < ApplicationController
  def index
    @newsletters = Newsletter.all 
  end

  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)

    if @newsletter.save
      redirect_to newsletters_path, notice: "The newsletter #{@newsletter.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy
    redirect_to newsletters_path, notice: "The newsletter #{@newsletter.name} has been deleted."
  end

  private
  def newsletter_params
    params.require(:newsletter).permit(:name, :attachment)
  end
end
