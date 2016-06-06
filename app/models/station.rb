class Station < OpenStruct
  def self.service
    @service ||= NrelService.new
  end

  def self.find_by(params)
    service.get_location(params).map { |station| new(params)}
  end
end
