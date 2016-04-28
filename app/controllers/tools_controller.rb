class ToolsController < ApplicationController

  def index
    # @tools = Tool.where(user_id: current_user.id)
    # user = User.find(session[:user_id])
    # @tools = user.tools
    @tools = current_user.tools
    session[:hit_counter] = session[:hit_counter].to_i + 1
  end

  def new
    @tool = current_user.tools.new
  end

  def create
    @tool = current_user.tools.new(tool_params)
    if @tool.save
      flash[:notice] = "The tool '#{@tool.name}' was created."
      # session[:most_recent_tool_id] = @tool.id
      # session[:current_tool_count] = Tool.count
      # session[:current_potential_revenue] = Tool.sum(:price).to_f
      redirect_to user_tool_path(current_user, @tool)
    else
      flash[:error] = @tool.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @tool = current_user.tools.find(params[:id])
  end

  def edit
    
  end



  def destroy
    tool = Tool.find(session[:user_id])
    tool.destroy
    flash[:notice] = "The tool '#{tool.name}' has been deleted!"
    redirect_to user_tools_path(current_user)
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity, :category_id)
  end
end

#
# def most_recent_tool_id
#   Tool.last.id
# end
#
# def most_recent_tool
#   if session[:most_recent_tool_id] != nil
#     Tool.find(session[:most_recent_tool_id])
#   else
#     Tool.new
#   end
# end
#
# def current_tool_summary
#   "#{session[:current_tool_count]} tools with a total value of $#{session[:current_potential_revenue]}"
# end
