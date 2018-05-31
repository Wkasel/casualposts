module PostsHelper

  def form_action_url
    path = request.original_fullpath.split('/')
    path.delete(path.last)
    path.delete(path.last)
    return path.join('/')
  end
end
