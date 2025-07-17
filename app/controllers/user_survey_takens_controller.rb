class UserSurveyTakensController < ApplicationController
  def new
    @survey ||= create_testing_survey # This works around the form not submitting
    @user_survey_taken = build_user_survey_taken
  end

  def create
    @user_survey_taken = UserSurveyTaken.new(user_survey_takens_params)
    @survey ||= create_testing_survey 
    survey_saved = @user_survey_taken.save

    if survey_saved
      @user_survey_taken.completed_at = Time.zone.now
      @user_survey_taken.save # TBD tighten error up

      flash[:notice] = "Survey was successfully created."
      redirect_to surveys_path  # Redirects to surveys_index path, change TBD
    else
      flash[:notice] = "Survey was not created."
      render :new, status: :unprocessable_entity
    end

  end

  def index
     @user_survey_takens = UserSurveyTaken.all
    # taken surveys list
    # show the taken surveys, add show button on each line to show taken survey
    # add show results button on survey index to show summary results for each survey
    # add index filters (survey, user); add sorts, primary: survey_title, ln, fn
  end

  private

  def user_survey_takens_params
    params.require(:user_survey_taken).permit!

    # params.require(:user_survey_taken).permit(:user_id, :survey_id, option_responses_attributes: [:survey_id, :question_id, :option_id, :option_response] )
  end

  def create_testing_survey
    @survey = Survey.create(user: User.first, survey_text: 'My Survey', description: 'a description')
    @survey.questions << Question.new(question_text: 'Do you like Ruby?')
    @survey.questions << Question.new(question_text: 'Are you a team player?')
    @survey.questions.first.options << Option.new(option_text: 'Yes') # row_index, set later
    @survey.questions.first.options << Option.new(option_text: 'No') # row_index, set later
    @survey.questions.last.options << Option.new(option_text: 'Always') # row_index, set later
    @survey.questions.last.options << Option.new(option_text: 'Mostly') # row_index, set later
    @survey.questions.last.options << Option.new(option_text: 'Seldom') # row_index, set later
    @survey
  end

  def build_user_survey_taken
    # we prepopulate the results (ust --> option_response)
    user_survey_taken = UserSurveyTaken.new(user: current_user, survey: @survey)
    questions = @survey.questions
    questions.each do |question|
      options = question.options
      options.each do |option|
        user_survey_taken.option_responses << OptionResponse.new(question: question, option: option)
      end
    end
    user_survey_taken
  end
end
