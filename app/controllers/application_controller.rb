class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/tasks" do
    tasks =Task.all
    tasks.to_json
  end

  post '/tasks' do
    tasks = Task.create(
      task_name: params[:task_name],
      description: params[:description],
      due_date: params[:due_date],
      status: params[:status => "Complete"] || false
    )
    tasks.to_json
  end

  patch '/tasks/:id' do
    tasks = Task.find(params[:id])
    tasks.update(
      description: params[:description],
      due_date: params[:due_date]
    )
    tasks.to_json
  end

  delete '/tasks/:id' do
    tasks = Task.find(params[:task_name])
    tasks.destroy
    tasks.to_json
  end

  post "/login" do
    user = User.where(["username=? and password=?", params[:username], params[:password]])[0]

    if (user.nil?)
      status 403
      {error: "Wrong email or password"}.to_json
    else
      status 200
      session[:user_id] = user.id
      user.to_json
    end

    get "/users" do
      begin
        # authorized
        status 200
        User.all.to_json(except: [:created_at, :updated_at], include: [:projects])
      rescue ActiveRecord::RecordNotFound => e
        status 401
        {error: "Unauthorized"}.to_json
      end
    end
  
    get "/users/:id" do
      begin
        # authorized
        user = User.find_by(id: params[:id])
  
        if(user.nil?)
          status 404
          {error: "User not found"}.to_json
        else
          status 200
          user.to_json(include: [:projects])
        end
      rescue ActiveRecord::RecordNotFound => e
        status 401
        {error: "Unauthorized"}.to_json
      end
    end
    
end
