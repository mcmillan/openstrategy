class SlackController < ApplicationController
  def new
  end

  def create
    @response = HTTParty.post(
      'https://open-strategy.slack.com/api/users.admin.invite',
      body: slack_params.merge(token: ENV['SLACK_API_TOKEN'])
    )

    @body = @response.parsed_response.with_indifferent_access

    unless @body[:ok]
      case @body[:error]
      when 'already_invited'
        @error = 'Looks like we\'ve already invited you! Look for an email from feedback@slack.com.'
      when 'already_in_team'
        @error = 'Looks like you\'re already in our Slack! Head over to open-strategy.slack.com to get involved.'
      else
        @error = "An error occurred while talking to Slack (#{@body[:error]}). Try again later."
      end
      return render :new
    end

    @email = slack_params[:email]
  end

  private

  def slack_params
    params.require(:slack).permit(:email)
  end
end
