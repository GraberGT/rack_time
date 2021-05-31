class TimeFormatter
  TIME_FORMATS = {
    'year' => '%Y/',
    'month' => '%m/',
    'day' => '%d',
    'hour' => '%H:',
    'minute' => '%M:',
    'second' => '%S'
  }

  def initialize(params)
    @response = set_time_format(params)
    @correct_format = ''
    @incorrect_formats = []
  end

  private

  def show_incorrect_formats
    @status = 400
    "Incorrect time format #{@incorrect_formats}"
  end

  def show_time
    @status = 200
    Time.current.strftime(@correct_formats)
  end
end