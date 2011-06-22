class ArticlesSweeper < ActionController::Caching::Sweeper
  observe Article

  def after_update(record)
    expire(record)
  end
  
  def after_create(record)
    expire(record)
  end
  
  def after_destroy(record)
    expire(record)
  end

  def expire(article)
    expire_page :controller => 'articles', 
                :action     => 'index'
    expire_action :controller => 'articles', 
                  :action     => 'show', 
                  :id         => article
    expire_fragment 'tag_cloud'
  end
end
