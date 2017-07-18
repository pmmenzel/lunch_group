class GroupController < ApplicationController
  def generate_groups
    @groups = create_groups
    render :home#, { groups: @groups }
  end

  private

  def all_users
    # User.first(3)
    User.all
  end

  def create_groups(n)
    n += 1

    if @list.size < 3 && @groups.empty?
      @groups["Group #{n}"] = @list
      return
    elsif @list.size >= 3
      sample = @list.sample(3)
      @groups["Group #{n}"] = sample.map(&:name)
      @list = @list - sample
    else
      return if @list.empty?
      rand_group = @groups.keys.sample
      sample = @list.sample(@list.size)
      @groups[rand_group] << sample unless @groups[rand_group] >=5
      @list = @list - sample
    end
    @list.empty? ? return : create_groups(n)
  end
end
