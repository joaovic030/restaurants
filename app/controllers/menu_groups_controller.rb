class MenuGroupsController < ApplicationController
  before_action :set_menu_group, only: %i[ show update destroy ]

  # GET /menu_groups
  def index
    @menu_groups = MenuGroup.all

    render json: @menu_groups
  end

  # GET /menu_groups/1
  def show
    render json: @menu_group
  end

  # POST /menu_groups
  def create
    @menu_group = MenuGroup.new(menu_group_params)

    if @menu_group.save
      render json: @menu_group, status: :created, location: @menu_group
    else
      render json: @menu_group.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /menu_groups/1
  def update
    if @menu_group.update(menu_group_params)
      render json: @menu_group
    else
      render json: @menu_group.errors, status: :unprocessable_content
    end
  end

  # DELETE /menu_groups/1
  def destroy
    @menu_group.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_group
      @menu_group = MenuGroup.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def menu_group_params
      params.expect(menu_group: [ :name, :description ])
    end
end
