class List < ApplicationRecord
  before_validation :assign_secrets, on: :create
  validates :share_secret, presence: true, uniqueness: true
  validates :master_secret, presence: true, uniqueness: true
  validates :title, presence: true
  has_many :items, inverse_of: :list, dependent: :delete_all

  def to_param
    raise "Use share_secret or master_secret instead"
  end

  private

  SECRET_LENGTH = 12

  def assign_secrets
    if self.share_secret.present? || self.master_secret.present?
      raise "Invariant: Somehow already has a secret (#{self.attributes}"
    end

    self.share_secret = SecureRandom.alphanumeric(SECRET_LENGTH)
    self.master_secret = SecureRandom.alphanumeric(SECRET_LENGTH)
  end
end
