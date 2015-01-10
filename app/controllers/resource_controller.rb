class ResourceController < ApplicationController
  def index
    @videos = Video.all.order('priority')
    @links = ResourceLink.all.order('priority')
  end

  def add_video
    videos = Video.all.order("priority")
    last_vid_priority = videos.any? ? videos.last.priority : 0
    video = Video.new
    video.url = params['url']
    video.priority = last_vid_priority + 1
    video.description = params['description']
    video.save
    redirect_to resource_path
  end

  def delete_video
    video = Video.find(params['id'])
    Video.where('priority > ?', video.priority).each do |vid|
      vid.priority = vid.priority - 1
      vid.save
    end
    video.destroy
    render nothing: true
  end

  def main_video
    video = Video.find(params['id'])
    Video.where('priority < ?', video.priority).each do |vid|
      vid.priority = vid.priority + 1
      vid.save
    end
    video.priority = 1
    video.save
    render nothing: true
  end

  def video_description
    desc = Video.find(params['id']).description
    respond_to do |format|
      format.json { render json: { description: desc } }
    end
  end

  def add_link
    links = ResourceLink.all.order('priority')
    last_link = links.any? ? links.last.priority : 0
    link = ResourceLink.new
    link.url = params['url']
    link.description = params['description']
    link.priority = last_link + 1
    link.save
    redirect_to resource_path
  end

  def delete_link
    link = ResourceLink.find(params['id'])
    ResourceLink.where('priority > ?', link.priority).each do |l|
      l.priority = l.priority - 1
      l.save
    end
    link.destroy
    redirect_to resource_path
  end

  def link_up
    link = ResourceLink.find(params['id'])
    prior_link = ResourceLink.where(priority: (link.priority - 1))
    if prior_link.any?
      p = prior_link.first
      p.priority = link.priority
      p.save
    end
    link.priority = link.priority - 1
    link.save
    redirect_to resource_path
  end

  def link_down
    link = ResourceLink.find(params['id'])
    next_link = ResourceLink.where(priority: (link.priority + 1))
    if next_link.any?
      n = next_link.first
      n.priority = link.priority
      n.save
    end
    link.priority = link.priority + 1
    link.save
    redirect_to resource_path
  end

end
