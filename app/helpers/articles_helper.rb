module ArticlesHelper
 
 def article_params
  params.require(:article).permit(:title, :description, :main_image, :user_id)
 end
 
end
