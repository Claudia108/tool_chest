class ToolsController < ApplicationController
  helper_method :most_recent_tool, :current_tool_summary

  def index
    @tools = Tool.all
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      flash[:notice] = "The tool '#{@tool.name}' was created."
      session[:most_recent_tool_id] = @tool.id
      session[:current_tool_count] = Tool.count
      session[:current_potential_revenue] = Tool.sum(:price).to_f
      redirect_to tool_path(@tool)
    else
      flash[:error] = @tool.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def destroy
    tool = Tool.find(params[:id])
    tool.destroy
    flash[:notice] = "The tool '#{tool.name}' has been deleted!"
    redirect_to tools_path
  end

  private

  def most_recent_tool_id
    Tool.last.id
  end

  def most_recent_tool
    if session[:most_recent_tool_id] != nil
      Tool.find(session[:most_recent_tool_id])
    else
      Tool.new
    end
  end

  def current_tool_summary
    "#{session[:current_tool_count]} tools with a total value of $#{session[:current_potential_revenue]}"
  end

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity)
  end
end
