class SettingsController < ApplicationController

  def index
    @settings = Setting.find(1)
    render json: @settings
  end

  def update
    @settings = Setting.find (1)
    @settings.update(settings_params)
    render_jsonapi(@settings)
  end

  private

  def settings_params
    jsonapi_params.slice(:setting1, :setting2)
  end

end