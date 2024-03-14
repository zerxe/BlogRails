require "test_helper"
class BlogPostTest < ActiveSupport::TestCase

  @@blog_post_data = nil

  setup do
    yaml_data =YAML.load(ERB.new(File.read(file_fixture('blog_posts.yml'))).result)
    @@blog_post_data = yaml_data
  end

  test "draft? returns true for draft blog post" do
    assert BlogPost.new(@@blog_post_data['draft']).draft?
  end

  test "draft? returns false for published blog post" do
    refute BlogPost.new(@@blog_post_data['published']).draft?
  end

  test "draft? returns false for scheduled blog post" do
    refute BlogPost.new(@@blog_post_data['scheduled']).draft?
  end

  test "published? returns true for published blog post" do
    assert BlogPost.new(@@blog_post_data['published']).published?
  end

  test "published? returns false for draft blog post" do
    refute BlogPost.new(@@blog_post_data['draft']).published?
  end

  test "published? returns false for scheduled blog post" do
    refute BlogPost.new(@@blog_post_data['scheduled']).published?
  end

  test "scheluded? returns true for scheduled blog post" do
    assert BlogPost.new(@@blog_post_data['scheduled']).scheduled?
  end

  test "scheluded? returns false for draft blog post" do
    refute BlogPost.new(@@blog_post_data['draft']).scheduled?
  end

  test "scheluded? returns false for published blog post" do
    refute BlogPost.new(@@blog_post_data['published']).scheduled?
  end

  def draft_blog_post
    BlogPost.new(published_at: nil)
  end
end