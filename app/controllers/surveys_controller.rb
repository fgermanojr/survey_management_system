class SurveysController < ApplicationController
  def new
    @survey = Survey.new
    3.times { @survey.questions.build }
    @survey.questions.each do |q|
      3.times {q.options.build}
    end
  end

  def create
    @survey = Survey.new(survey_params)
    survey_saved = @survey.save

    if survey_saved
      flash[:notice] = "Survey was successfully created."
      redirect_to survey_edit_path  # TBD change redirect to ___
    else
      flash[:notice] = "Survey was not created."
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @surveys = Survey.all
  end

  def show
    # TBD
  end

  def edit
    # TBD
  end

  def update
    # TBD
  end

  def survey_params
    params.require(:survey).permit!

    # params.require(:survey).permit(:a, :b, questions_attributes: [:id, :question_text], options_attributes: [:id, :option_text, :is_selected])
  end
end
