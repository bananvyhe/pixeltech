class User < ApplicationRecord
  rolify
  has_one :client, dependent: :destroy
  has_one :gameboard 
  has_many :my_items
  has_many :appointments
  has_many :vks, :through => :appointments
  has_many :gameboards, -> { distinct }, :through => :votes
  has_many :visiblegroups
  has_many :groupsvks, :through => :visiblegroups
  has_many :votes, as: :voteable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  # def remember_me
  #   true
  # end
  # validates_presence_of   :username, if: :username_required?  
  # validates_presence_of   :email, if: :email_required?
  # validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
  # validates_format_of     :email, with: email_regexp, allow_blank: true, if: :email_changed?

  # validates_presence_of     :password, if: :password_required?
  # validates_confirmation_of :password, if: :password_required?
  # validates_length_of       :password, within: password_length, allow_blank: true
  
    # enum role: [:user, :voodoo, :admin, :superadmin, :client]
    # необходимо вначале задеплоить таблицу кланы, с закоменченной моделью и кодом ниже
    # внести первую роль user и после можно раскомменыивать код парсящий кланы в массив
  clans = Clan.all
  @roles =[]
  clans.each do |i|
    @roles << i.clan
  end
  enum role: @roles

  after_initialize :set_default_role, :if => :new_record?
 

  def set_default_role
    self.role ||= :user
    self.add_role :user
  end
  protected
  # From Devise module Validatable
  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  # From Devise module Validatable
  def email_required?
    true
  end
  def username_required?
    true
  end
end
