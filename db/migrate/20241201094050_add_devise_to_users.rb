# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.2]
  def change
    change_table :users do |t|
      # Check if the email column exists before adding it again
      unless column_exists?(:users, :email)
        t.string :email, default: "", null: false
      end
      t.string :encrypted_password, default: "", null: false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      # Add other Devise columns you may need (for example):
      # t.string :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string :unconfirmed_email
    end
  end
end
