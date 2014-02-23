class LoadersController < ApplicationController
  def new
    user = User.find(params[:user_id])

    project = Project.find_by_host_name(params[:host_name])
    if project
      page = project.pages.where(:route => params[:route]).first
      if page
        hash_data = page.get_full_page_hash(user)
      else
        hash_data = {:status => 'blankPage'}
      end
    else
      hash_data = {:status => 'newProject'}
    end

    render :partial => 'renders/js/application.js.erb', :locals => {:json => hash_data.to_json}
  end

  def load_css
    render :template => 'renders/css/tuggler.css'
  end

  def load_fancybox_css
    render :template => 'renders/js/libraries/fancybox/jquery.fancybox.css'
  end
end
