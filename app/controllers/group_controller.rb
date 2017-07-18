class GroupController < ApplicationController
  def home
    @groups = GroupGenerator.new(all_users).generate unless all_users.empty?
  end

  private

  def all_users
    User.all
  end

  class GroupGenerator
    attr_accessor :list

    def initialize(list)
      @list = list
    end

    def generate
      groups = list.shuffle.each_slice(3).to_a
      extras = groups.select { |group| group.size < 3 }
      groups = groups - extras
      extras.each do |extra_group|
        extra_group.each { |user| groups.sample << user }
        extras.delete(extra_group)
      end
      groups
    end
  end
end
