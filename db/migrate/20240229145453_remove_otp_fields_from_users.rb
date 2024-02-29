class RemoveOtpFieldsFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :otp_secret, :string
    remove_column :users, :consumed_timestep, :integer
    remove_column :users, :otp_required_for_login, :boolean
  end
end
