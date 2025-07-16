class SurveysController < ApplicationController
  def new
    @survey = Survey.new
    3.times { @survey.questions.build }
    @survey.questions.each do |q|
      3.times {q.options.build}
    end
  end

  def create
    @survey = Survey.new
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
