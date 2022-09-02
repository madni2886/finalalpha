# frozen_string_literal: true
class ArticlesController < ApplicationController
  def index
    @article = Article.page(params[:page]).per(10)
  end

  def new
    if logged_in?
      @article = Article.new
    else
      redirect_to login_path
    end
  end

  def destroy
    if logged_in?
      @article = Article.find(params[:id])
      @article.destroy
      flash[:notice] = "Article was succ deleted"
      redirect_to user_article_path
    else
      redirect_to login_path
    end
  end

  def edit
    if logged_in?
      @article = Article.find(params[:id])
      @article.avatar.attach(params[:avatar])
    else
      redirect_to login_path
    end
  end

  def update
    if logged_in?
      @article = Article.find(params[:id])

      if @article.update(article_params)
        flash[:notice] = "Article was successfully updated"

        redirect_to user_article_path(@article)
      else
        render "edit"
      end
    else
      redirect_to login_path
    end
  end

  def show
    @comment = Comment.new
    @article = Article.find(params[:id])

    session[:article_id] = @article.id

    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Title:#{@article.title}"
        pdf.text "Description:#{@article.description}"
        a_image = StringIO.open(@article.avatar.download)

        pdf.image a_image, fit: [400, 600], position: :center

        send_data pdf.render, filename: "article_#{@article.id}.pdf", type: "application/pdf", disposition: "inline"
      end
    end
  end

  def create
    if logged_in?
      @article = Article.new(article_params)
      @article.user = current_user
      respond_to do |format|
        if @article.save
          format.html { redirect_to user_article_path(@article), notice: "Atricle was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    else
      redirect_to login_path
    end
  end

  private

  def pdf_download
    @article = Article.find(params[:id])

    session[:article_id] = @article.id
  end

  def article_params
    params.require(:article).permit(:title, :description, :avatar)
  end
end
