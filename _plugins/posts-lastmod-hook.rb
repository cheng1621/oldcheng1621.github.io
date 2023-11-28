<<<<<<< HEAD
# Check for changed posts
=======
#!/usr/bin/env ruby
#
# Check for changed posts

>>>>>>> 3ed5eb1ee005122b798b001c352f1086e1901740
Jekyll::Hooks.register :posts, :post_init do |post|

  commit_num = `git rev-list --count HEAD "#{ post.path }"`

  if commit_num.to_i > 1
    lastmod_date = `git log -1 --pretty="%ad" --date=iso "#{ post.path }"`
<<<<<<< HEAD
    post.data['lastmod'] = lastmod_date
=======
    post.data['last_modified_at'] = lastmod_date
>>>>>>> 3ed5eb1ee005122b798b001c352f1086e1901740
  end

end
