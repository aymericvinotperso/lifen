require 'date'

class Communication

  COST_OF_FIRST_PAGE = 10
  COST_OF_NEXT_PAGE = 7
  COST_OF_COLOR = 18
  COST_OF_EXPRESS_DELIVERY = 60

  def initialize(id, pages_number, color, sent_at, express_delivery)
    @id = id
    @pages_number = pages_number
    @color = color
    @sent_at = sent_at
    @express_delivery = express_delivery
  end

  def has_color?
    @color
  end

  def express_delivery?
    @express_delivery
  end

  def cost_in_cents
    cost_in_cents = COST_OF_FIRST_PAGE + COST_OF_NEXT_PAGE * (@pages_number - 1)
    cost_in_cents += COST_OF_COLOR if has_color?
    cost_in_cents += COST_OF_EXPRESS_DELIVERY if express_delivery?

    cost_in_cents
  end

  def day_sent_at
    DateTime.parse(@sent_at).to_date
  end
end
