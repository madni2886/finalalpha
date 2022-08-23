class ArticlesController<ApplicationController

def index
    if logged_in?


    @article = Article.page(params[:page]).per(4)
    else
    redirect_to login_path
    end
end
def new
    if logged_in?


    @article=Article.new
    else
        redirect_to login_path
    end

end
def destroy
    if logged_in?
    @article=Article.find(params[:id])
    @article.destroy
    flash[:notice]="Article was succ deleted"
    redirect_to article_path

    else
        redirect_to login_path
    end

    end



def edit
    if logged_in?
        @article=Article.find(params[:id])
    else
        redirect_to login_path

    end
end




def update
    if logged_in?
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
    
    flash[:notice] = "Article was successfully updated"
    
    redirect_to article_path(@article)
    
    else
    
    render 'edit'
    
    end
    else
        redirect_to login_path
    end

end

def show
    if logged_in?
        @article = Article.find(params[:id])
    else
        redirect_to login_path
    end


end

def create


if logged_in?
    @article = Article.new(article_params)
    @article.user=current_user
    respond_to do |format|

        if @article.save
            format.html { redirect_to article_path(@article), notice: "Atricle was successfully created." }
        else
            format.html { render :new, status: :unprocessable_entity }
        end
    end
else
    redirect_to login_path
    end
    end

private

def article_params

    params.require(:article).permit(:title, :description)

end
end