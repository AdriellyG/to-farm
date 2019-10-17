class Usuario < ApplicationRecord
  belongs_to :pessoa_fisica, class_name: "PessoaFisica", optional: true
  
  has_one :funcionario

  has_secure_password

  validates_presence_of :email, :password_digest

  #VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  #validates email, presence: true, length: {maximum: 260}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}
  #before_save { self.email = email.downcase }
end