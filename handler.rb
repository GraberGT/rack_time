class Handler
  attr_reader :status

  private

  def parameters(params)
    params.each do |format|
      return @correct_format += TIME_FORMATS[format] if TIME_FORMATS[format]
      @incorrect_formats << format
    end
  end

  def set_time_format(params)
    parameters(params['format'].split(','))

    return show_incorrect_formats unless @incorrect_formats.empty?
    show_time
  end
end
