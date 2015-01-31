== README

This is a minimal Ruby on Rails application that illustrates the [rspec-rails](https://github.com/rspec/rspec-rails) bug fixed by [PR #1289](https://github.com/rspec/rspec-rails/pull/1289).

* Ruby 2.1.0
* Rails 4.2.0
* RSpec Core 3.1.7
* RSpec Rails 3.1.0

The specific issue at hand involves:

* A view spec for a view template located at the root of `/app/views`:
    * [`/app/views/test_view.html.erb`](app/views/test_view.html.erb)
    * [`/spec/views/test_view.erb_spec.rb`](spec/views/test_view.erb_spec.rb)
* A class named `Helper` elsewhere in the specs - in this case, within [`/spec/requests/posts_spec.rb`](spec/requests/posts_spec.rb#L11)

Typically view specs use the path to the view to discern the appropriate name of a helper to be auto-loaded, e.g. a view spec `RSpec.describe "posts/edit", :type => :view` would auto-load `PostsHelper`.

Since the example group for in `/spec/views/test_view.erb_spec.rb` has a description with no path element, the `ViewExampleGroup` attempts to auto-load related helpers was trying to find (and load) a helper named `Helper`.
