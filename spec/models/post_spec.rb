require 'rails_helper'

RSpec.describe Post, :type => :model do
  it 'requires a title' do
    expect(Post.new(title: '')).not_to be_valid
  end
end
