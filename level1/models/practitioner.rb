class Practitioner
  attr_reader :id

  def initialize(id, first_name, last_name, express_delivery)
    @express_delivery = express_delivery
    @id = id
    @first_name = first_name
    @last_name = last_name
  end

  def has_express_delivery?
    @express_delivery
  end
end
