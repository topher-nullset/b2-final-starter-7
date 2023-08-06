class InvoiceItem < ApplicationRecord
  validates_presence_of :invoice_id,
                        :item_id,
                        :quantity,
                        :unit_price,
                        :status

  belongs_to :invoice
  belongs_to :item

  enum status: [:pending, :packaged, :shipped]

  def self.incomplete_invoices
    invoice_ids = InvoiceItem.where("status = 0 OR status = 1").pluck(:invoice_id)
    Invoice.order(created_at: :asc).find(invoice_ids)
  end

  def discounted_price
    applicable_discount = item.applicable_discount(quantity)
    if applicable_discount
      discounted_price = (quantity * unit_price * (1 - applicable_discount.percentage/100.00)).ceil(2)
      discounted_price
    else
      unit_price * quantity
    end
  end
end
