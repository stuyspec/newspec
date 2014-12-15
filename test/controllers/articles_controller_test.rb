require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = articles(:one)
    puts @article.inspect
    puts @article.author.inspect
    puts Profile.find(@article.author_id).inspect
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article" do
    # assert_difference('Article.count') do
      p =post :create, article: { author: @article.author, publish_date: @article.publish_date, status: @article.status, title: @article.title+'2' }
    puts p.body
    # end
    assert_redirected_to article_path(assigns(:article))
  end

  test "should show article" do
    get :show, id: @article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @article
    assert_response :success
  end

  test "should update article" do
    patch :update, id: @article, article: { author: @article.author, publish_date: @article.publish_date, status: @article.status, title: @article.title }
    assert_redirected_to article_path(assigns(:article))
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article
    end

    assert_redirected_to articles_path
  end
end
