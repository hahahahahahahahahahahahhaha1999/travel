document.getElementById('like-btn<%= @article.id %>').innerHTML = "<%= j(render partial: 'likes/like', locals: {article: @article}) %>"