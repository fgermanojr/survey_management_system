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
    @survey.questions << Question.new(question_text: 'question 1 text')
    @survey.questions << Question.new(question_text: 'question 2 text')
    @survey.questions.first.options << Option.new(option_text: 'option 1 text') # row_index, set later
    @survey.questions.first.options << Option.new(option_text: 'option 2 text') # row_index, set later
    @survey.questions.last.options << Option.new(option_text: 'option 1 text') # row_index, set later
    @survey.questions.last.options << Option.new(option_text: 'option 2 text') # row_index, set later
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
