class SurveysController < ApplicationController
  def new
    @survey = Survey.new
    3.times { @survey.questions.build }
    @survey.questions.each do |q|
      3.times {q.options.build}
    end
  end

  def create
    binding.pry
    @survey = Survey.new(survey_params)
    survey_saced = @survey.save

    if survey_saved
      flash[:notice] = "Survey was successfully created."
      redirect_to survey_edit_path  # Redirects to show action;  TBD CHANGE
    else
      flash[:notice] = "Survey was not created."
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @surveys = Survey.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def take
  end

  def survey_params
    params.require(:survey).permit!

    # params.require(:survey).permit(:a, :b, questions_attributes: [:id, :question_text], options_attributes: [:id, :option_text, :is_selected])
  end
end
