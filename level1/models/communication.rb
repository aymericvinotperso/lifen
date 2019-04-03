class Communication
  attr_reader :practitioner

  def initialize(id, pages_number, color, sent_at, practitioner)
    @id = id
    @pages_number = pages_number
    @color = color
    @sent_at = sent_at
    @practitioner = practitioner
  end

  def has_color?
    @color
  end

  def cost_in_cents
    cost_in_cents = 10 + 7 * (@pages_number - 1)
    cost_in_cents += 18 if has_color?
    cost_in_cents += 60 if @practitioner.has_express_delivery?

    cost_in_cents
  end

  def day_sent_at
    @sent_at[0..9]
  end
end
