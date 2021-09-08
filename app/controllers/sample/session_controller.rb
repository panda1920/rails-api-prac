class Sample::SessionController < ApplicationController
  before_action :print_info

  def set_cookie
    session[:hello] = params[:hello] if params[:hello]
    session[:world] = params[:world] if params[:world]

    render json: {
      succes: true,
      message: 'You have set cookie for yourself',
      hello: session[:hello].to_s(),
      world: session[:world].to_s(),
    }
  end

  def get_cookie
    render json: {
      succes: true,
      message: 'Printing out the content of your cookie',
      hello: session[:hello].to_s(),
      world: session[:world].to_s(),
    }    
  end

  def remove_cookie
    session[:hello] = nil
    session[:world] = nil

    render json: {
      succes: true,
      message: 'Removed all of your cookie'
    }
  end

  def post_cookie
    # curl -X POST -H "Content-Type: application/json" -d '{ "hello": "rails", "world": 99999 }' localhost:3000/sample/api/session/post
    session[:hello] = params[:hello] if params[:hello]
    session[:world] = params[:world] if params[:world]

    render json: {
      success: true,
      message: 'Saved posted content as cookie'
    }
  end

  private

  def print_info
    p '###request body:'
    p request.body.read
    p '###session:'
    p session[:hello]
    p session[:world]
    p '###params:'
    p params[:hello]
    p params[:world]
  end
end
