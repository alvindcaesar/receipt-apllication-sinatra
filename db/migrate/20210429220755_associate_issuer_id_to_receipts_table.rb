class AssociateIssuerIdToReceiptsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :receipts, :issuer_id, :integer
  end
end
