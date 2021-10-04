# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  birthday        :date
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#
class User < ApplicationRecord
    has_secure_password

    validates :name,
     presence: true,
     uniqueness: true,
     length: { maximum: 16 },
     format: {
         with: /\A[a-z0-9]+\z/,
         message: 'は小文字英数字で入力してくだい'
     }
    validates :password,
     length: { minimum: 8}

     def age
        now = Time.zone.now
        (now.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000
     end
end
