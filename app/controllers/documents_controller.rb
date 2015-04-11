class DocumentsController < ApplicationController
  def index
    @documents = Documents.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document.params)

    if @doucment.save
      redirect_to documents_path, notice: "The file #{@resume.name} has been successfully uploaded."
    else
      render "new"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, notice:  "The resume #{@resume.name} has been deleted."
  end

private
  def document_params
    params.requier(:document).permit(:name, :attachment)
  end
end
